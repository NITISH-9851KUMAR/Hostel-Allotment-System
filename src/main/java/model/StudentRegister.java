package model;

public class StudentRegister {

    private String prn;
    private String password;

    public StudentRegister() {
    }

    public StudentRegister(String prn, String password) {
        this.prn = prn;
        this.password = password;
    }

    public String getPrn() {
        return prn;
    }

    public void setPrn(String prn) {
        this.prn = prn;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
