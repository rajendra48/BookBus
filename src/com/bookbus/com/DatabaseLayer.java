package com.bookbus.com;

import java.sql.*;
import java.util.ArrayList;

import com.microsoft.sqlserver.jdbc.SQLServerDataSource;

public class DatabaseLayer {

	Connection con;

	public DatabaseLayer() {
//		try {
//			SQLServerDataSource ds = new SQLServerDataSource();
//			ds.setUser("rp");
//			ds.setPassword("123456789");
//			ds.setServerName("localhost\\SQLEXPRESS");
//			ds.setPortNumber(1433);
//			ds.setDatabaseName("bookbus");
//			//con = ds.getConnection();
//			con=DriverManager.getConnection( "jdbc:sqlserver://localhost:1433;" +
//				     "instance=SQLEXPRESS;databaseName=BookBus;","rp","123456789");
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
	}
	
	
	
	
	private Connection getConnection()
	{
		try
		{
			SQLServerDataSource ds = new SQLServerDataSource();
			ds.setUser("rp");
			ds.setPassword("Prasads");
			ds.setServerName("localhost\\SQLEXPRESS");
			ds.setPortNumber(1433);
			ds.setDatabaseName("bookbus");
			con = ds.getConnection();
		}
		catch(Exception e)
		{
			return null;
		}
		return con;
	}

	public int getVendorCount()
	{
		
		try {

			con=getConnection();
			Statement stmt = con.createStatement();
			ResultSet result = stmt
					.executeQuery("SELECT COUNT(*) AS C FROM Vendors");
			if (result.next()) {
				return result.getInt("c");
			} else {
				return 0;
			}

		} catch (Exception e) {
			return 0;
		}
		finally
		{
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	
	public int getBranchCount()
	{
		
		try {

			con=getConnection();
			Statement stmt = con.createStatement();
			ResultSet result = stmt
					.executeQuery("SELECT COUNT(*) AS C FROM Vendor_Branch");
			if (result.next()) {
				return result.getInt("c");
			} else {
				return 0;
			}

		} catch (Exception e) {
			return 0;
		}
		finally
		{
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	public AdminUser getStatus(String username, String password) {
		AdminUser user = new AdminUser();
		try {

			con=getConnection();
			Statement stmt = con.createStatement();
			ResultSet result = stmt
					.executeQuery("SELECT * FROM AdminUsers WHERE username='"
							+ username + "' AND password='" + password + "'");
			if (result.next()) {
				user.setId(result.getInt("id"));
				user.setName(result.getString("username"));
				user.setUser_Type(result.getString("user_type"));
				user.setUser_Image(result.getString("user_image"));
				user.setStatus(user.getId());
				user.setPassword(result.getString("password"));

				return user;
			} else {
				user.setStatus(-1);
			}

		} catch (Exception e) {
			user.setStatus(-100);
		}
		finally
		{
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return user;
	}
	

	public int insertBus(String bus_name,String vendor_id,String minFare,String busType,String capacity)
	{
		try
		{
			if(checkBus(bus_name, vendor_id))
			{
				return -2;
			}
			con=getConnection();
			Statement stmt=con.createStatement();
			String query="INSERT INTO [dbo].[Bus_Details] (" +					
					"[Bus_Name]" +
					",[Bus_Type]" +
					",[Vendor_Id]" +
					",[Capacity]" +
					",[Minimum_Fare]" +
					")" +
					"VALUES ('"+bus_name+"','"+busType+"',"+vendor_id+"," +
							""+capacity+","+minFare+")";
			return stmt.executeUpdate(query);
		}
		catch(Exception e)
		{
			return -1;
		}
		finally
		{
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	
	
	
	public int insertStopDetails(String stop_type,String location,String contact,String other_details)
	{
		try
		{
			con=getConnection();
			Statement stmt=con.createStatement();
			String query="INSERT INTO [dbo].[Bus_Stop] (" +					
					"[Bus_Stop_Type]" +
					",[Location]" +
					",[Contact_No]" +
					",[Other_Details]" +					
					")" +
					"VALUES ('"+stop_type+"','"+location+"','"+contact+"'," +
							"'"+other_details+"')";
			return stmt.executeUpdate(query);
		}
		catch(Exception e)
		{
			return -1;
		}
		finally
		{
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	
	
	public int insertNewSchedule(String bus_id,String from_location,String from_date,String from_time,String to_location,String to_date,String to_time)
	{
		int val=0;
		try
		{
			con=getConnection();
			Statement stmt=con.createStatement();
			String query="INSERT INTO [dbo].[Schedules] (" +					
					"[Bus_ID]" +
					",[Bus_Stop_ID_From]" +
					",[From_Time]" +
					",[Bus_Stop_ID_To]" +
					",[To_Time]" +
					",[Status]" +					
					")" +
					"VALUES ("+bus_id+",'"+from_location+"','"+from_date+" "+from_time+"'," + "'"+to_location+"',"+
							"'"+to_date+" "+to_time+"','Pending')";
			val+=stmt.executeUpdate(query);
		}
		catch(Exception e)
		{
			return (val=-1);
		}
		finally
		{
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return val;
	}
	
	
	
	
	
	public int insertBranch(String branch_name,String vendor_id,String address,String description,String branch_phone,String branch_type,String busses_capacity)
	{
		try
		{
			if(checkBranchr(branch_name, vendor_id))
			{
				return -2;
			}
			con=getConnection();
			Statement stmt=con.createStatement();
			String query="INSERT INTO [dbo].[Vendor_Branch] (" +					
					"[Vendor_Id]" +
					",[Branch_Name]" +
					",[Location]" +
					",[Description]" +
					",[Phno]" +
					",[Branch_Type]" +
					",[Total_Busses_Capacity]" +
					",[Rank_Density]" +
					")" +
					"VALUES ("+vendor_id+",'"+branch_name+"','"+address+"'," +
							"'"+description+"','"+branch_phone+"','"+branch_type+"','"+busses_capacity+"'," +"'1')";
			return stmt.executeUpdate(query);
		}
		catch(Exception e)
		{
			return -1;
		}
		finally
		{
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	
	public int insertVendor(String vendor_username,String vendor_password,String vendor_name,String vendor_tag,String vendor_description,String vendor_website,String vendor_shortname,String vendor_email,String vendor_phone,String vendor_url)
	{
		try
		{
			if(checkVendor(vendor_username))
			{
				return -2;
			}
			con=getConnection();
			Statement stmt=con.createStatement();
			String query="INSERT INTO [dbo].[Vendors] (" +					
					"[Vendor_Login]" +
					",[Password]" +
					",[Vendor_Name]" +
					",[Short_Name]" +
					",[Tag]" +
					",[Description]" +
					",[Website_Link]" +
					",[Email]" +
					",[Image_url]" +
					",[Phone_No]" +
					",[Vendor_Rank])" +
					"VALUES ('"+vendor_username+"','"+vendor_password+"','"+vendor_name+"'," +
							"'"+vendor_tag+"','"+vendor_shortname+"','"+vendor_description+"','"+vendor_website+"'," +
							"'"+vendor_email+"','"+vendor_url+"','"+vendor_phone+"','1')";
			return stmt.executeUpdate(query);
		}
		catch(Exception e)
		{
			return -1;
		}
		finally
		{
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public int updateVendor(String id,String vendor_username,String vendor_password,String vendor_name,String vendor_tag,String vendor_description,String vendor_website,String vendor_shortname,String vendor_email,String vendor_phone,String vendor_url)
	{
		try
		{
			
			con=getConnection();
			Statement stmt=con.createStatement();
			String query="UPDATE [dbo].[Vendors] SET " +"[Vendor_Login]='" +vendor_username+"'"+
					",[Password]='" +vendor_password+"'"+
					",[Vendor_Name]='" +vendor_name+"'"+
					",[Short_Name]='" +vendor_shortname+"'"+
					",[Tag]='" +vendor_tag+"'"+
					",[Description]='" +vendor_description+"'"+
					",[Website_Link]='" +vendor_website+"'"+
					",[Email]='" +vendor_email+"'"+
					",[Image_url]='" +vendor_url+"'"+
					",[Phone_No]='" +vendor_phone+"' "+
					" WHERE Vendor_id="+id+"";
			return stmt.executeUpdate(query);
		}
		catch(Exception e)
		{
			return -1;
		}
		finally
		{
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		
	}
	
	public int updateBranch(String branch_id,String branch_name,String vendor_id,String address,String description,String branch_phone,String branch_type,String busses_capacity)
	{
		try
		{
			if(checkBranchr(branch_name, vendor_id))
			{
				return -2;
			}
			con=getConnection();
			Statement stmt=con.createStatement();
			String query="UPDATE  [dbo].[Vendor_Branch] SET " +					
					"[Vendor_Id]=" +vendor_id+""+
					",[Branch_Name]='" +branch_name+"'"+
					",[Location]='" +address+"'"+
					",[Description]='" +description+"'"+
					",[Phno]='" +branch_phone+"'"+
					",[Branch_Type]='" +branch_type+"'"+
					",[Total_Busses_Capacity]='" +busses_capacity+"' WHERE Branch_id="+branch_id+"";
			return stmt.executeUpdate(query);
		}
		catch(Exception e)
		{
			return -1;
		}
		finally
		{
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	
	public boolean checkVendor(String vendor_name)
	{
		
		try {

			con=getConnection();
			Statement stmt = con.createStatement();
			ResultSet result = stmt
					.executeQuery("SELECT * FROM Vendors WHERE Vendor_Login='"
							+ vendor_name + "");
			if (result.next()) {
				return true;
			} else {
				return false;
			}

		} catch (Exception e) {
			return false;
		}
		finally
		{
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	
	public boolean checkBus(String branch_name,String vendor_id)
	{
		
		try {

			con=getConnection();
			Statement stmt = con.createStatement();
			ResultSet result = stmt
					.executeQuery("SELECT * FROM Bus_Details WHERE Bus_Name='"
							+ branch_name + " AND Vendor_Id="+vendor_id);
			if (result.next()) {
				return true;
			} else {
				return false;
			}

		} catch (Exception e) {
			return false;
		}
		finally
		{
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public boolean checkBranchr(String branch_name,String vendor_id)
	{
		
		try {

			con=getConnection();
			Statement stmt = con.createStatement();
			ResultSet result = stmt
					.executeQuery("SELECT * FROM Vendor_Branch WHERE Branch_Name='"
							+ branch_name + " AND Vendor_Id="+vendor_id);
			if (result.next()) {
				return true;
			} else {
				return false;
			}

		} catch (Exception e) {
			return false;
		}
		finally
		{
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	public ArrayList<Vendors> getVendor(int page_no)
	{
		
		ArrayList<Vendors> vendors=new ArrayList<Vendors>();
		try {

			String from="";
			String to="";
				from=(page_no-1*10)+1+"";
				to=page_no*10+"";
			
			con=getConnection();
			Statement stmt = con.createStatement();
			ResultSet result = stmt
					.executeQuery("SELECT * FROM vendor_view WHERE row>="+from+" AND row<="+to+"");
			while (result.next()) {
				Vendors v=new Vendors();
				v.setName(result.getString("Vendor_Name"));
				v.setLogin_name(result.getString("Vendor_Login"));
				v.setId(result.getInt("Vendor_id"));
				v.setPassword(result.getString("Password"));
				v.setShort_name(result.getString("Short_Name"));
				v.setTag(result.getString("Tag"));
				v.setDescription(result.getString("Description"));
				v.setWebsite(result.getString("Website_Link"));
				v.setEmail(result.getString("Email"));				
				v.setPhone_no(result.getString("Phone_No"));
				v.setLogo_url(result.getString("Image_url"));
				vendors.add(v);
				
			} 

		} catch (Exception e) {
			e.printStackTrace();
		}
		finally
		{
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return vendors;
	}
	
	
	public ArrayList<Branch> getBranch(int vendor_id,String vendor_ids)
	{
		
		ArrayList<Branch> branches=new ArrayList<Branch>();
		try {

			
			con=getConnection();
			Statement stmt = con.createStatement();
			ResultSet result = stmt
					.executeQuery("SELECT * FROM branch_view WHERE Vendor_Id="+vendor_id+"");
			while (result.next()) {
				Branch v=new Branch();
				v.setBranch_id(result.getInt("Branch_id"));
				v.setVendori_id(result.getInt("Vendor_Id"));
				v.setName(result.getString("Branch_Name"));
				v.setLocation(result.getString("Location"));
				v.setDescription(result.getString("Description"));
				v.setPhno(result.getString("Phno"));
				v.setBranch_type(result.getString("Branch_Type"));
				v.setCapacity(""+result.getInt("Total_Busses_Capacity"));
				v.setStatus(1);
				
				branches.add(v);
				
			} 

		} catch (Exception e) {
			e.printStackTrace();
		}
		finally
		{
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return branches;
	}
	
	
	
	public ArrayList<Branch> getBranch(int page_no)
	{
		
		ArrayList<Branch> branches=new ArrayList<Branch>();
		try {

			String from="";
			String to="";
				from=(page_no-1*10)+1+"";
				to=page_no*10+"";
			
			con=getConnection();
			Statement stmt = con.createStatement();
			ResultSet result = stmt
					.executeQuery("SELECT * FROM branch_view WHERE row>="+from+" AND row<="+to+"");
			while (result.next()) {
				Branch v=new Branch();
				v.setBranch_id(result.getInt("Branch_id"));
				v.setVendori_id(result.getInt("Vendor_Id"));
				v.setName(result.getString("Branch_Name"));
				v.setLocation(result.getString("Location"));
				v.setDescription(result.getString("Description"));
				v.setPhno(result.getString("Phno"));
				v.setBranch_type(result.getString("Branch_Type"));
				v.setCapacity(""+result.getInt("Total_Busses_Capacity"));
				v.setStatus(1);
				
				branches.add(v);
				
			} 

		} catch (Exception e) {
			e.printStackTrace();
		}
		finally
		{
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return branches;
	}
	
	
	
	
	
	
	
	public ArrayList<Vendors> getVendor()
	{
		
		ArrayList<Vendors> vendors=new ArrayList<Vendors>();
		try {

			
			
			con=getConnection();
			Statement stmt = con.createStatement();
			ResultSet result = stmt
					.executeQuery("SELECT * FROM vendor_view ");
			while (result.next()) {
				Vendors v=new Vendors();
				v.setName(result.getString("Vendor_Name"));
				v.setLogin_name(result.getString("Vendor_Login"));
				v.setId(result.getInt("Vendor_id"));
				v.setPassword(result.getString("Password"));
				v.setShort_name(result.getString("Short_Name"));
				v.setTag(result.getString("Tag"));
				v.setDescription(result.getString("Description"));
				v.setWebsite(result.getString("Website_Link"));
				v.setEmail(result.getString("Email"));				
				v.setPhone_no(result.getString("Phone_No"));
				v.setLogo_url(result.getString("Image_url"));
				vendors.add(v);
				
			} 

		} catch (Exception e) {
			e.printStackTrace();
		}
		finally
		{
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return vendors;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	public ArrayList<Bus> getBusVendorList()
	{
		
		ArrayList<Bus> vendors=new ArrayList<Bus>();
		try {

			
			
			con=getConnection();
			Statement stmt = con.createStatement();
			ResultSet result = stmt
					.executeQuery("SELECT * FROM Bus_Details ");
			while (result.next()) {
				Bus v=new Bus();
				v.setId(result.getInt("Bus_Id"));
				
				v.setVendor_id(result.getInt("Vendor_id")+"");
				v.setBus_type(result.getString("Bus_Type"));
				v.setName(result.getString("Bus_Name"));
				v.setCapacity(result.getInt("Capacity"));
//				v.setMin_fare((result.getString("Minimum_Fare"));
//				v.setWebsite(result.getString("Website_Link"));
//				v.setEmail(result.getString("Email"));				
//				v.setPhone_no(result.getString("Phone_No"));
//				v.setLogo_url(result.getString("Image_url"));
				vendors.add(v);
				
			} 

		} catch (Exception e) {
			e.printStackTrace();
		}
		finally
		{
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return vendors;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public ArrayList<BusStop> getBusStop()
	{
		
		ArrayList<BusStop> busstops=new ArrayList<BusStop>();
		try {

			
			
			con=getConnection();
			Statement stmt = con.createStatement();
			ResultSet result = stmt
					.executeQuery("SELECT * FROM Bus_Stop ");
			while (result.next()) {
				BusStop bs=new BusStop();
				bs.setBusStop_id(result.getInt("Bus_Stop_Id"));
				bs.setContact_no(result.getString("Contact_No"));
				bs.setOther_details(result.getString("Other_Details"));
				bs.setLocation(result.getString("Location"));
				
				busstops.add(bs);
				
			} 

		} catch (Exception e) {
			e.printStackTrace();
		}
		finally
		{
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return busstops;
	}
	
	
	
	
	
	
	public int deleteVendor(String id)
	{
		try
		{
			con=getConnection();
			Statement stmt=con.createStatement();
			String query="DELETE FROM VENDORS WHERE Vendor_id="+id+" ";
			return stmt.executeUpdate(query);
		}
		catch(Exception e)
		{
			return -1;
		}
		finally
		{
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	public int deleteBranch(String id)
	{
		try
		{
			con=getConnection();
			Statement stmt=con.createStatement();
			String query="DELETE FROM Vendor_Branch WHERE Branch_id="+id+" ";
			return stmt.executeUpdate(query);
		}
		catch(Exception e)
		{
			return -1;
		}
		finally
		{
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public Vendors getVendor(String id)
	{
		Vendors v=new Vendors();
		try
		{
			con=getConnection();
			Statement stmt=con.createStatement();
			String query="SELECT * FROM VENDORS WHERE Vendor_id="+id+" ";
			ResultSet result=stmt.executeQuery(query);
			
			if(result.next())
			{
				v.setName(result.getString("Vendor_Name"));
				v.setLogin_name(result.getString("Vendor_Login"));
				v.setId(result.getInt("Vendor_id"));
				v.setPassword(result.getString("Password"));
				v.setShort_name(result.getString("Short_Name"));
				v.setTag(result.getString("Tag"));
				v.setDescription(result.getString("Description"));
				v.setWebsite(result.getString("Website_Link"));
				v.setEmail(result.getString("Email"));				
				v.setPhone_no(result.getString("Phone_No"));
				v.setLogo_url(result.getString("Image_url"));
				v.setStatus(1);
			}
			else
			{
				v.setStatus(0);
				v.setErrorMsg("Vendor not Found");
			}
		}
		catch(Exception e)
		{
			v.setStatus(0);
			v.setErrorMsg(e.toString());
		}
		finally
		{
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return v;
	}
	
	
	
	
	
	
	
	public Branch getBranch(String id)
	{
		Branch v=new Branch();
		try
		{
			con=getConnection();
			Statement stmt=con.createStatement();
			String query="SELECT * FROM Vendor_Branch WHERE Branch_id="+id+" ";
			ResultSet result=stmt.executeQuery(query);
			
			if(result.next())
			{
				
				v.setBranch_id(result.getInt("Branch_id"));
				v.setVendori_id(result.getInt("Vendor_Id"));
				v.setName(result.getString("Branch_Name"));
				v.setLocation(result.getString("Location"));
				v.setDescription(result.getString("Description"));
				v.setPhno(result.getString("Phno"));
				v.setBranch_type(result.getString("Branch_Type"));
				v.setCapacity(""+result.getInt("Total_Busses_Capacity"));
				v.setStatus(1);
				
				
			}
			else
			{
				v.setStatus(0);
				v.setErrorMsg("Vendor not Found");
			}
		}
		catch(Exception e)
		{
			v.setStatus(0);
			v.setErrorMsg(e.toString());
		}
		finally
		{
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return v;
	}
}
