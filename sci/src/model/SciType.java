package model;

public class SciType {
	private String typeId;
	private String typeName;
	
	public String getTypeId() {
		return typeId;
	}
	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	@Override
	public String toString() {
		return "SciType [typeId=" + typeId + ", typeName=" + typeName + "]";
	}
}
