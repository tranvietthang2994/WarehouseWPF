using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using System.Linq;
using DataAccessLayer.DAO;
using QuanLiKho.Model;
using System.Windows.Input;
using LiveCharts;
using LiveCharts.Wpf;


namespace QuanLiKho
{
	public class MainWindowViewModel : INotifyPropertyChanged
	{
		public ICommand RefreshCommand => new RelayCommand(_ => LoadData());

		public SeriesCollection SeriesCollection { get; set; }
		public List<string> Labels { get; set; }

		private ObservableCollection<InventoryModel> _tonKhoList;
		public ObservableCollection<InventoryModel> TonKhoList
		{
			get => _tonKhoList;
			set
			{
				_tonKhoList = value;
				OnPropertyChanged();
			}
		}

		private int _tongTonKho;
		public int TongTonKho
		{
			get => _tongTonKho;
			set
			{
				_tongTonKho = value;
				OnPropertyChanged();
			}
		}

		private int _tongNhap;
		public int TongNhap
		{
			get => _tongNhap;
			set
			{
				_tongNhap = value;
				OnPropertyChanged();
			}
		}

		private int _tongXuat;
		public int TongXuat
		{
			get => _tongXuat;
			set
			{
				_tongXuat = value;
				OnPropertyChanged();
			}
		}

		public MainWindowViewModel()
		{
			LoadData();
			LoadChartData();
		}

		public void LoadData()
		{
			// Lấy danh sách vật tư
			var objects = ObjectDAO.Instance.GetAll();

			// Tính toán dữ liệu tồn kho
			TonKhoList = new ObservableCollection<InventoryModel>(
				objects.Select(obj => new InventoryModel
				{
					Object = obj,
					Count = InputDAO.Instance.GetAll().Where(i => i.ObjectId == obj.ObjectId).Sum(i => i.Count)
							- OutputDAO.Instance.GetAll().Where(o => o.ObjectId == obj.ObjectId).Sum(o => o.Count)
				})
			);

			// Tính tổng tồn kho, nhập, xuất
			TongTonKho = TonKhoList.Sum(t => t.Count);
			TongNhap = InputDAO.Instance.GetAll().Sum(i => i.Count);
			TongXuat = OutputDAO.Instance.GetAll().Sum(o => o.Count);

			// Gọi thêm LoadChartData nếu cần làm mới biểu đồ
			LoadChartData();
		}


		public event PropertyChangedEventHandler? PropertyChanged;

		protected void OnPropertyChanged([CallerMemberName] string? propertyName = null)
		{
			PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
		}

		public void LoadChartData()
		{
			// Initialize dictionaries for nhập và xuất kho by month
			var nhapKhoByMonth = new Dictionary<int, int>();
			var xuatKhoByMonth = new Dictionary<int, int>();

			// Query nhập kho data
			var allInputs = InputDAO.Instance.GetAll();
			foreach (var input in allInputs)
			{
				var month = input.InputDate.Month;
				if (!nhapKhoByMonth.ContainsKey(month))
				{
					nhapKhoByMonth[month] = 0;
				}
				nhapKhoByMonth[month] += input.Count;
			}

			// Query xuất kho data
			var allOutputs = OutputDAO.Instance.GetAll();
			foreach (var output in allOutputs)
			{
				var month = output.OutputDate.Month;
				if (!xuatKhoByMonth.ContainsKey(month))
				{
					xuatKhoByMonth[month] = 0;
				}
				xuatKhoByMonth[month] += output.Count;
			}

			// Calculate tồn kho by month
			var tonKhoByMonth = new Dictionary<int, int>();
			for (int month = 1; month <= 12; month++)
			{
				var nhap = nhapKhoByMonth.ContainsKey(month) ? nhapKhoByMonth[month] : 0;
				var xuat = xuatKhoByMonth.ContainsKey(month) ? xuatKhoByMonth[month] : 0;
				tonKhoByMonth[month] = nhap - xuat;
			}

			// Prepare data for the chart
			Labels = Enumerable.Range(1, 12).Select(m => $"Tháng {m}").ToList();
			SeriesCollection = new SeriesCollection
			{
				new ColumnSeries
				{
					Title = "Tồn kho",
					Values = new ChartValues<int>(tonKhoByMonth.Values)
				}
			};

			OnPropertyChanged(nameof(SeriesCollection));
			OnPropertyChanged(nameof(Labels));
		}
	}
}
