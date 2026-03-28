package model;


public class Warden {
    private Long id;
    private String password;
    private String name;

    public Warden(){
    }

    public Warden(Long id, String password) {
        this.id = id;
        this.password = password;
    }

    public Warden(Long id, String password, String name) {
        this.id = id;
        this.password = password;
        this.name = name;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
