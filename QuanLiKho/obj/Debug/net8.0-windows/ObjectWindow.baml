   M S B A M L   `   `   `  ����D  @QuanLiKho, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null%clr-namespace:QuanLiKho	QuanLiKho  5   	   ;"clr-namespace:QuanLiKho.ControlBarQuanLiKho.ControlBar  5   	       QuanLiKho.ObjectWindow   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   )localclr-namespace:QuanLiKho     5   	   1uc"clr-namespace:QuanLiKho.ControlBar     5   	   _ [MaterialDesignThemes.Wpf, Version=5.1.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5	   	      MaterialDesignBody#���   5
   	   $��Regular"�5   	   $��13(�5   	   &   System.Windows.Media.TextOptions    TextFormattingMode$  Ideal=�5   	      TextRenderingMode$
 Auto=�5   	     MaterialDesignPaper#���  5   	     MaterialDesignFont#���  5   	    � 
ResizeMode$ NoResize=�5   	    � WindowStyle$
 None=�5   	    � WindowStartupLocation$ CenterScreen=�5   	    � Title$ ObjectWindow��5   	   $	��450��6   $	��800��6+   .��5      �  � RowDefinitions 5   
   �� 5      $
��auto �6   6,   �� 5      6   .+�5   
   � $��0��6   .+�5      '   !QuanLiKho.ControlBar.ControlBarUC  
 � Tag 6   �� *Title+ �� ElementName$ window��6J   5      � 5    
   $��1��6    5!      �� 5"      $
��auto �6    60   �� 5#      $
��auto �6    60   �� 5$      6"   .+�5(      #  MaterialDesignThemes.Wpf.Card  $��0��6"   $��5q�6/   .��5)      � $��0 0 0 10q�6   .+�5*      �� -   5        	 ��Name$	 txtObjectName��5*      $��5 5 15 5q�6v   )  #MaterialDesignThemes.Wpf.HintAssist
   Hint$
 Tên vật tư��6�    % !MaterialDesignFloatingHintTextBox#��[ 6�   ��65   �� *
ObjectName+ �� UpdateSourceTrigger$ PropertyChanged=�6�   �� 5+      -   5        $��cbUnit��5+      $��5 5 15 5q�6-    �� DisplayMemberPath$ UnitName��6?    �� SelectedValuePath$ UnitId��6\   $
 Đơn vị đo��6�    �� 
IsEditable$
 True��6   & "MaterialDesignFloatingHintComboBox#��[ 6+  ��6x   �� *Unit+ �� SelectedItem 6�   �� *SelectedUnit+ �� Mode$ TwoWay=�$ PropertyChanged=�6i  �� 5,      -   5        $��
cbSupplier��5,      $��5 5 15 5q�61   $ SupplierName��6D   $ 
SupplierId��6e   $
 Nhà cung cấp��6   $
 True��60  #��[ 6B  ��6�   �� *	Suplier+ 6�   �� *SelectedSuplier+$ TwoWay=�$ PropertyChanged=�6�  5-      5.        52      $��1��6"   $��5q�6/   .��53      � .+�54      �� -   5        $��Thêm��54   <   $��5q�6K   $	��100��6V   ��6   �� *
AddCommand+6y   �� 55      -   5        $��Sửa��55   =   $��5q�6L   $	��100��6W   ��6   �� *EditCommand+6|   �� 56      -   5        $��Xóa��56   ?   $��5q�6N   $	��100��6Y   ��6   �� *DeleteCommand+6~   57      58        5:      $��2��6"   $��5q�6/   $��Stretch=�6:   .��5;      �� $
��Auto=�6   .��5<      &   System.Windows.Controls.DataGrid  -   5          Name$ dgObject��5<         AutoGenerateColumns$ False��6�      HeadersVisibility$ Column=�6�      CanUserAddRows$ False��6�      CanUserDeleteRows$ False��6�      
IsReadOnly$
 True��6�    6\   �� *SelectedItem+$ OneWayToSource=�   Columns 5=      0  *System.Windows.Controls.DataGridTextColumn  5>      ,  &System.Windows.Controls.DataGridColumn   Header$ Id��61      Width5  /System.Windows.Controls.DataGridLengthConverter$
 Auto 6Z   1	  +System.Windows.Controls.DataGridBoundColumn 	  Binding 6=   �� *
ObjectId+6Z     5?      $ Tên vật tư��61   $
 Auto 6d    6E   �� *
ObjectName+6d     5@      $ Đơn vị đo��61   $
 Auto 6f    6D   �� *Unit.UnitName+6f     5A      $ Nhà cung cấp��61   $
 Auto 6q    6G   �� *Supplier.SupplierName+6q   5C      5E      5F      5G      5I      5J      