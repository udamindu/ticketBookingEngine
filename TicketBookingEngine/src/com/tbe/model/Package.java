package com.tbe.model;

import com.tbe.controller.DBAccess;
import com.tbe.controller.PackageController;
import com.tbe.controller.ResourseController;

public class Package {
	
	String Pid;
	String name;
	String eventName;
	String description;
	String tot;
	String Rid;
	String Rcatergory;
	String Rname;
	String Rquantity;
	
	
		public Package()
		{
			
		}
		
		public Package(String Pid, String name, String description, String tot,String Rid,String Rcatergory,String Rname,String Rquantity)
		{
			this.Pid=Pid;	
			this.name=name;				
			this.description=description;
			this.tot=tot;	
			this.Rid=Rid;
			this.Rcatergory=Rcatergory;			
			this.Rname=Rname;						
			this.Rquantity=Rquantity;					
		}
		
		public Package(String id, String PName,  String description, String tot, String Rcat, String Rname, String Rqty)
		{
			this.name=PName;	
			this.Pid = id;
			this.description=description;
			this.tot=tot;	
			this.Rcatergory=Rcat;			
			this.Rname=Rname;						
			this.Rquantity=Rqty;	
		}
		
		// for the insert query
		public Package(String name, String description,String tot,String Rcatergory,String Rname,String Rquantity)
		{			
			this.name=name;			
			this.description=description;
			this.tot=tot;				
			this.Rcatergory=Rcatergory;			
			this.Rname=Rname;						
			this.Rquantity=Rquantity;			
					
		}
		
		public boolean insertData ()
		{
			PackageController pc = new PackageController();
			ResourseController rc=new ResourseController();
			
			boolean state =  false;	
			boolean state2= false;
			String cat_id = rc.getCategoryID(Rcatergory);
			System.out.println(cat_id);
			
			String brand_id = rc.getBrandID(Rname);
			System.out.println(brand_id);
			
			String item_id = pc.getItemID(cat_id, brand_id);
			state = pc.addNewPackageN(name, eventName, description, tot, Rcatergory, Rname, Rquantity, cat_id, brand_id, item_id );
			state2 = pc.addPack_PItems();
			return (state && state2);
						
		}
		
		public boolean updateData()
		{
			PackageController rc=new PackageController();
			boolean state =  false;	
			state = rc.updateNewPackageN(Pid, name, description, tot, Rcatergory, Rname, Rquantity);
			return state; 
			
		}

		public String getPid() {
			return Pid;
		}

		public void setPid(String pid) {
			Pid = pid;
		}

		public String getName() {
			return name;
		}


		public String getDescription() {
			return description;
		}

		public void setDescription(String description) {
			this.description = description;
		}

		public String getTot() {
			return tot;
		}

		public String getEventName() {
			return eventName;
		}

		public void setEventName(String eventName) {
			this.eventName = eventName;
		}

		public void setName(String name) {
			this.name = name;
		}

		public void setTot(String tot) {
			this.tot = tot;
		}

		public String getRid() {
			return Rid;
		}

		public void setRid(String rid) {
			Rid = rid;
		}

		public String getRcatergory() {
			return Rcatergory;
		}

		public void setRcatergory(String rcatergory) {
			Rcatergory = rcatergory;
		}

		public String getRname() {
			return Rname;
		}

		public void setRname(String rname) {
			Rname = rname;
		}

		public String getRquantity() {
			return Rquantity;
		}

		public void setRquantity(String rquantity) {
			Rquantity = rquantity;
		}

}
