package domain;

/**
 * Create By Intellij idea
 * Author:Macro
 * Date:2021/4/29
 * Time:11:15
 * Describe:
 */

public class ScenicCollectInfo {
    private int scenicId;
    private int userId;

    public ScenicCollectInfo() {
    }

    public ScenicCollectInfo(int scenicId, int userId) {
        this.scenicId = scenicId;
        this.userId = userId;
    }

    public int getScenicId() {
        return scenicId;
    }

    public void setScenicId(int scenicId) {
        this.scenicId = scenicId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
    public String toString(){
        return "scenicId: "+scenicId+", userId: "+userId;
    }
}
