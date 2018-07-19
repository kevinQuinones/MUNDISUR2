package model.entity;

import java.time.ZoneId;
import java.util.Date;
import java.util.HashMap;
import java.util.TimeZone;

import javax.jdo.PersistenceManager;
import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import com.google.appengine.repackaged.org.joda.time.DateTimeZone;
import com.google.appengine.repackaged.org.joda.time.LocalDateTime;

import controller.PMF;
@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class Invoice {
	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY) private Long id;
	@Persistent private String address;
	@Persistent private int quant;
	@Persistent private double cost;
	@Persistent private String RUC;
	@Persistent private String name;
	@Persistent private Date made;
	@Persistent private double total;
	@Persistent private int number;
	@Persistent private long idProduct;
	@Persistent public HashMap <Long,Integer> Cola;

	public Invoice( double cost,int quant, String address, String RUC, String name, int number, long idProduct ) {
		this.cost = cost;
		this.quant=quant;
		this.name=name;
		this.address=address;
		this.RUC=RUC;
		this.total=cost*quant;
		this.number=number;
		LocalDateTime ldt = LocalDateTime.now(DateTimeZone.forID("America/Lima"));
		this.made=ldt.toDate();
		this.Cola= new HashMap<Long,Integer>();
		this.idProduct=idProduct;
		Cola.put(idProduct, quant);
	}
	public Invoice(){
		
	}
	public static void main( String []args){
		LocalDateTime ldt = LocalDateTime.now(DateTimeZone.forID("America/Lima"));
		Date made=ldt.toDate();
		System.out.print(made);
	}
	public Long getId() {
		return id;
	}
	
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	public int getQuant() {
		return quant;
	}
	public void setQuant(int quant) {
		this.quant = quant;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public double getCost() {
		return cost;
	}
	public void setCost(double cost) {
		this.cost = cost;
	}
	public String getRUC() {
		return RUC;
	}
	public void setRUC(String rUC) {
		RUC = rUC;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public Date getMade() {
		return made;
	}
	public void setMade(Date made) {
		this.made = made;
	}
	public HashMap<Long,Integer> getCola() {
		return this.Cola;
	}
	public void setCola(long idProduct, int x) {
		this.Cola.put(idProduct, x);
	}
	
	public long getIdProduct() {
		return idProduct;
	}
	public void setIdProduct(long idProduct) {
		this.idProduct = idProduct;
	}
	public String getNprod(){
		PersistenceManager pm = PMF.get().getPersistenceManager();
		Product prod=pm.getObjectById(Product.class,idProduct);
		pm.close();
		return prod.getNombre()+"/"+prod.getBrand();

	}
	
}
