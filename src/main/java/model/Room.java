package model;

public class Room {
    String prn;
    String room_number;
    String allot_date;

    public Room() {}

    public Room(String prn, String room_number, String allot_date) {
        this.prn = prn;
        this.room_number = room_number;
        this.allot_date = allot_date;
    }

    public String getPrn() {
        return prn;
    }

    public void setPrn(String prn) {
        this.prn = prn;
    }

    public String getRoom_number() {
        return room_number;
    }

    public void setRoom_number(String room_number) {
        this.room_number = room_number;
    }

    public String getAllot_date() {
        return allot_date;
    }

    public void setAllot_date(String allot_date) {
        this.allot_date = allot_date;
    }

}
