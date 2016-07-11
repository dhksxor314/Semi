/*
 *  작성자 : 전현영
 *  설명 : 장소 DTO
 *   
 */

package dto;

public class Place_Dto {


		private int place_num;            
		private String place_name;           
		private String address;              
		private String phone;               
		private int capacity;            
		private int price;
		public int getPlace_num() {
			return place_num;
		}
		public void setPlace_num(int place_num) {
			this.place_num = place_num;
		}
		public String getPlace_name() {
			return place_name;
		}
		public void setPlace_name(String place_name) {
			this.place_name = place_name;
		}
		public String getAddress() {
			return address;
		}
		public void setAddress(String address) {
			this.address = address;
		}
		public String getPhone() {
			return phone;
		}
		public void setPhone(String phone) {
			this.phone = phone;
		}
		public int getCapacity() {
			return capacity;
		}
		public void setCapacity(int capacity) {
			this.capacity = capacity;
		}
		public int getPrice() {
			return price;
		}
		public void setPrice(int price) {
			this.price = price;
		}              

	
	
}
