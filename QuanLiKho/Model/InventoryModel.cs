using BusinessObject;
using DataAccessLayer.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLiKho.Model
{
	public class InventoryModel
	{
		public int InventoryId;
		public Objectss Object { get; set; }
		public int Count { get; set; }

		public InventoryModel()
		{

		}


	}
}