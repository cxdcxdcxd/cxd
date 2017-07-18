package model;

public class cart {
private int cartid;
private int userid;
private int oppoid;
private int quantity;
private Oppo oppos;
public Oppo getOppos() {
	return oppos;
}
public void setOppos(Oppo oppos) {
	this.oppos = oppos;
}
public int getOppoid() {
	return oppoid;
}
public void setOppoid(int oppoid) {
	this.oppoid = oppoid;
}
public int getCartid() {
	return cartid;
}
public void setCartid(int cartid) {
	this.cartid = cartid;
}
public int getUserid() {
	return userid;
}
public void setUserid(int userid) {
	this.userid = userid;
}
public int getQuantity() {
	return quantity;
}
public void setQuantity(int quantity) {
	this.quantity = quantity;
}

}
