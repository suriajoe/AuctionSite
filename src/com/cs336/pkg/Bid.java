package com.cs336.pkg;

import java.sql.Timestamp;

/**
 * Created by Baltsar on 8/11/2016.
 */
public class Bid {
    private int auctionId;
    private int amount;
    private int secretLimit;
    private String email;
    private Timestamp bidDate;

    public Bid( int auctionId, int amount, int secretLimit, String email, Timestamp bidDate) {
        this.auctionId = auctionId;
        this.amount = amount;
        this.secretLimit = secretLimit;
        this.email = email;
        this.bidDate = bidDate;
    }

    public int getAuctionId() {
        return auctionId;
    }

    public void setAuctionId(int auctionId) {
        this.auctionId = auctionId;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public int getSecretLimit() {
        return secretLimit;
    }

    public void setSecretLimit( int secretLimit ) {
        this.secretLimit = secretLimit;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Timestamp getBidDate() {
        return bidDate;
    }

    public void setBidDate(Timestamp bidDate) {
        this.bidDate = bidDate;
    }
}
