package cn.uestc.ssm.po;

public class Activity {
	private int id;
	private String name;
	private String startTime;
	private String duringTime;
	private int needPeople;
	private int existingPeople;
	private int selectedPeople;
	private int grades;
	private String description;
	private String image;
	private String location;
	private Person person;

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getDuringTime() {
		return duringTime;
	}
	public void setDuringTime(String duringTime) {
		this.duringTime = duringTime;
	}
	public int getNeedPeople() {
		return needPeople;
	}
	public void setNeedPeople(int needPeople) {
		this.needPeople = needPeople;
	}
	public int getExistingPeople() {
		return existingPeople;
	}
	public void setExistingPeople(int existingPeople) {
		this.existingPeople = existingPeople;
	}
	public int getSelectedPeople() {
		return selectedPeople;
	}
	public void setSelectedPeople(int selectedPeople) {
		this.selectedPeople = selectedPeople;
	}
	public int getGrades() {
		return grades;
	}
	public void setGrades(int grades) {
		this.grades = grades;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}

	public Person getPerson() {
		return person;
	}
	public void setPerson(Person person) {
		this.person = person;
	}
	@Override
	public String toString() {
		return "Activity [id=" + id + ", name=" + name + ", startTime=" + startTime + ", duringTime=" + duringTime
				+ ", needPeople=" + needPeople + ", existingPeople=" + existingPeople + ", selectedPeople="
				+ selectedPeople + ", grades=" + grades + ", description=" + description + ", image=" + image
				+ ", location=" + location + ", person=" + person + "]";
	}


	
	
}
