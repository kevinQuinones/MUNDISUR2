package model.entity;

import java.time.ZoneId;
import java.util.Date;
import java.util.TimeZone;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import com.google.appengine.repackaged.org.joda.time.DateTimeZone;
import com.google.appengine.repackaged.org.joda.time.LocalDateTime;
@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class Product  {
	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY) private Long id;
	@Persistent private String nombre;
	@Persistent private String code;
	@Persistent private int stock;
	@Persistent public int saled;
	@Persistent private double costI;
	@Persistent private double costF;
	@Persistent private String brand;
	@Persistent private double earnings;
	
	public Product( String nombre, double costI, double costF,int stock, String code, String brand) {
		this.costI = costI;
		this.costF = costF;
		this.stock=stock;
		this.earnings=Math.abs(costF-costI);
		this.code = code;
		this.nombre=nombre;
		this.brand= brand;
		this.saled=0;
	}
	
	public double getEarnings() {
		return earnings;
	}

	public void setEarnings(double earnings) {
		this.earnings = earnings;
	}

	public Long getId() {
		return id;
	}
	public int getstock() {
		return stock;
	}
	public double getCostF() {
		return costF;
	}
	public void setCostF(double costF) {
		this.costF = costF;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public double getCostI() {
		return costI;
	}
	public void setCostI(double cost) {
		this.costI = cost;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public int getSaled() {
		return saled;
	}

	public void setSaled(int saled) {
		this.saled = saled;
	}
	public boolean compareTo(Product x) {
		if(this.nombre.equals(x.nombre)&&
				this.code.equals(x.code)&&
				this.stock==(x.stock)&&
				this.costI==x.costI
				) 
			return true;
		else return false;
	}
	
}
