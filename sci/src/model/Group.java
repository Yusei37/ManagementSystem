package model;

public class Group {
	
	private int id;
	private String sciId;
	private String userId;
	private int weight;
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
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
	}
	@Override
	public String toString() {
		return "Group [id=" + id + ", sciId=" + sciId + ", userId=" + userId + ", weight=" + weight + "]";
	}
}
