package com.parking.parking.vo;

public class ParkingVO {
   private int park_id; 
   private String park_name;               
   private int park_capacity;
   private int mem_num;                           
   private String park_type;                  
   private String detailAddr;                  
   private int park_public;
   
   
   public int getPark_id() {
      return park_id;
   }
   public void setPark_id(int park_id) {
      this.park_id = park_id;
   }
   public String getPark_name() {
      return park_name;
   }
   public void setPark_name(String park_name) {
      this.park_name = park_name;
   }
   public int getPark_capacity() {
      return park_capacity;
   }
   public void setPark_capacity(int park_capacity) {
      this.park_capacity = park_capacity;
   }
   public int getMem_num() {
      return mem_num;
   }
   public void setMem_num(int mem_num) {
      this.mem_num = mem_num;
   }
   public String getPark_type() {
      return park_type;
   }
   public void setPark_type(String park_type) {
      this.park_type = park_type;
   }
   public String getDetailAddr() {
      return detailAddr;
   }
   public void setDetailAddr(String detailAddr) {
      this.detailAddr = detailAddr;
   }
   public int getPark_public() {
      return park_public;
   }
   public void setPark_public(int park_public) {
      this.park_public = park_public;
   }
	@Override
	public String toString() {
		return "ParkingVO [park_id=" + park_id + ", park_name=" + park_name + ", park_capacity=" + park_capacity
				+ ", mem_num=" + mem_num + ", park_type=" + park_type + ", detailAddr=" + detailAddr + ", park_public="
				+ park_public + "]";
	}
 
   
}