package talkdog.vo;

public class AdminMasterWrapperVO {
	private AdminVO avo;
    private MasterVO masvo;
	
    public AdminMasterWrapperVO(AdminVO avo, MasterVO masvo) {
		super();
		this.avo = avo;
		this.masvo = masvo;
	}

	public AdminVO getAvo() {
		return avo;
	}

	public void setAvo(AdminVO avo) {
		this.avo = avo;
	}

	public MasterVO getMasvo() {
		return masvo;
	}

	public void setMasvo(MasterVO masvo) {
		this.masvo = masvo;
	}
    
    
}
