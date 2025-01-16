package dto;

public class ReplyDto {
	private int rno;
	private int bno;
	private String content;
	private String writer;
	private String writerDate;
	
	public ReplyDto() {
		
	}
	
	public ReplyDto(int rno, int bno, String content, String writer, String writerDate) {
		this.rno = rno;
		this.bno = bno;
		this.content = content;
		this.writer = writer;
		this.writerDate = writerDate;
	}
	
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getWriterDate() {
		return writerDate;
	}
	public void setWriterDate(String writerDate) {
		this.writerDate = writerDate;
	}
	
	
}
