package com.cs336.pkg;

import java.sql.Timestamp;

/**
 * Created by Baltsar on 8/11/2016.
 */
public class Auction {
    private int auctionId;
    private String ownerEmail;
    private int reserve;
    private int autowin;
    private int itemId;
    private String winnerEmail;
    private Timestamp openTime;
    private Timestamp closeTime;

    public Auction(int auctionId, String ownerEmail, int itemId, int reserve, int autowin, String winnerEmail, Timestamp openTime, Timestamp closeTime) {
        this.auctionId = auctionId;
        this.ownerEmail = ownerEmail;
        this.itemId = itemId;
        this.reserve = reserve;
        this.autowin = autowin;
        this.winnerEmail = winnerEmail;
        this.openTime = openTime;
        this.closeTime = closeTime;
    }
    
    public Auction(int auctionId, int itemId)
    {
    	this.auctionId = auctionId;
    	this.itemId = itemId;
        this.ownerEmail = "";
        this.reserve = 0;
        this.autowin = 0;
        this.winnerEmail = "";
        this.openTime = null;
        this.closeTime = null;   	
    }

    public int getAuctionId() {
        return auctionId;
    }

    public void setAuctionId(int auctionId) {
        this.auctionId = auctionId;
    }

    public String getOwnerEmail() {
        return ownerEmail;
    }

    public void setOwnerEmail(String ownerEmail) {
        this.ownerEmail = ownerEmail;
    }

    public int getReserve() {
        return reserve;
    }

    public void setReserve(int reserve) {
        this.reserve = reserve;
    }
   
    public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    public int getAutowin() {
        return autowin;
    }

    public void setAutowin(int autowin) {
        this.autowin = autowin;
    }

    public String getWinnerEmail() {
        return winnerEmail;
    }

    public void setWinnerEmail(String winnerEmail) {
        this.winnerEmail = winnerEmail;
    }

    public Timestamp getOpenTime() {
        return openTime;
    }

    public void setOpenTime(Timestamp openTime) {
        this.openTime = openTime;
    }

    public Timestamp getCloseTime() {
        return closeTime;
    }

    public void setCloseTime(Timestamp closeTime) {
        this.closeTime = closeTime;
    }
}
