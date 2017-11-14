package Service;

import java.util.Date;

public class DataDriver {
    private String username;
    private String name;
    private int is_active;
    private String prefloc;
    private int ratingcount;
    private float avgrating;

    public DataDriver(){

    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getIs_active() {
        return is_active;
    }

    public void setIs_active(int is_active) {
        this.is_active = is_active;
    }

    public String getPrefloc() {
        return prefloc;
    }

    public void setPrefloc(String prefloc) {
        this.prefloc = prefloc;
    }

    public int getRatingcount() {
        return ratingcount;
    }

    public void setRatingcount(int ratingcount) {
        this.ratingcount = ratingcount;
    }

    public float getAvgrating() {
        return avgrating;
    }

    public void setAvgrating(float avgrating) {
        this.avgrating = avgrating;
    }
}
