package com.cs336.pkg;

/**
 * Created by Baltsar on 8/11/2016.
 */
public class SalesReport {

    private long totalEarnings;
    private int userCount;
    private int pcItemCount;
    private long pcItemEarnings;
    private int psItemCount;
    private long psItemEarnings;
    private int xbItemCount;
    private long xbItemEarnings;
    private int itemCount;
    private String bestCustomerEmail;
    private long bestCustomerSpent;

    public SalesReport(long totalEarnings, int userCount, int pcItemCount, long pcItemEarnings, int psItemCount,
            long psItemEarnings, int xbItemCount, long xbItemEarnings, String bestCustomerEmail,
			long bestCustomerSpent) {
        this.totalEarnings = totalEarnings;
        this.userCount = userCount;
        this.pcItemCount = pcItemCount;
        this.pcItemEarnings = pcItemEarnings;
        this.psItemCount = psItemCount;
        this.psItemEarnings = psItemEarnings;
        this.xbItemCount = xbItemCount;
        this.xbItemEarnings = xbItemEarnings;
        this.bestCustomerEmail = bestCustomerEmail;
		this.bestCustomerSpent = bestCustomerSpent;
        itemCount = pcItemCount + psItemCount + xbItemCount;
    }

    public long getTotalEarnings() {
        return totalEarnings;
    }

    public long getEarningsPerItem() {
        return totalEarnings / itemCount;
    }

    public long getEarningsPerUser() {
        return totalEarnings / userCount;
    }

    public long getPcItemEarnings() {
        return pcItemEarnings;
    }

    public long getPsItemEarnings() {
        return psItemEarnings;
    }

    public long getXbItemEarnings() {
        return xbItemEarnings;
    }

    public long getEarningsPerPcItem() {
        return pcItemEarnings/pcItemCount;
    }

    public long getEarningsPerPsItem() {
        return psItemEarnings/psItemCount;
    }

    public long getEarningsPerXbItem() {
        return xbItemEarnings/xbItemCount;
    }

    public int getUserCount() {
        return userCount;
    }

    public int getPcItemCount() {
        return pcItemCount;
    }

    public int getPsItemCount() {
        return psItemCount;
    }

    public int getXbItemCount() {
        return xbItemCount;
    }

    public int getItemCount() {
        return itemCount;
    }
	
    public String getBestCustomerEmail() {
        return bestCustomerEmail;
    }
	
	public long getBestCustomerSpent() {
		return bestCustomerSpent;
	}
}
