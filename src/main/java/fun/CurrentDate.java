package fun;

import java.time.ZonedDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;

public class CurrentDate {
    public static String currentDate(){
        // Asia/Kolkata time zone
        ZonedDateTime now = ZonedDateTime.now(ZoneId.of("Asia/Kolkata"));
        // format: date month year, hour minute
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd MMMM yyyy, HH:mm");
        String formattedDate = now.format(formatter);

        return formattedDate;
    }
}
