package domain;

/**
 * Create By Intellij idea
 * Author:Macro
 * Date:2021/5/1
 * Time:20:55
 * Describe:
 */

public class UserPreferInfo {
    private int userId;
    private int tagId;
    private float preferWeight;

    public UserPreferInfo() {

    }

    public UserPreferInfo(int userId, int tagId, float preferWeight) {
        this.userId = userId;
        this.tagId = tagId;
        this.preferWeight = preferWeight;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getTagId() {
        return tagId;
    }

    public void setTagId(int tagId) {
        this.tagId = tagId;
    }

    public float getPreferWeight() {
        return preferWeight;
    }

    public void setPreferWeight(float preferWeight) {
        this.preferWeight = preferWeight;
    }
}
