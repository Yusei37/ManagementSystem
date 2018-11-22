package model;

import java.util.Date;

public class History {
	
	private int id;
	private String sciId;
	private String result;
	private Date date;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSciId() {
		return sciId;
	}
	public void setSciId(String sciId) {
		this.sciId = sciId;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "History [id=" + id + ", sciId=" + sciId + ", result=" + result + ", date=" + date + "]";
	}
	
}
