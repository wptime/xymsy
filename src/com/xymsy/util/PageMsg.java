package com.xymsy.util;
/**
 * 
 * @author Administrator
 *
 */
public class PageMsg {
	public int num;//查询到的数据总量
	public boolean hasNextPage;//是否有下一页
	public boolean hasLastPage;//是否有上一页
	public double right;//价格右界，没有的话为99999999
	public double left;//价格左界，没有的话为0
	public int pageTotal;
	public int size;
	public int pageNum;
	
	public PageMsg()
	{
		num = 0;
		hasNextPage = false;
		hasLastPage = false;
		right = 99999999;
		left = 0;
		pageTotal = 1;
		size = 16;
		pageNum = 1;
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public boolean isHasNextPage() {
		return hasNextPage;
	}
	public void setHasNextPage(boolean hasNextPage) {
		this.hasNextPage = hasNextPage;
	}
	public boolean isHasLastPage() {
		return hasLastPage;
	}
	public void setHasLastPage(boolean hasLastPage) {
		this.hasLastPage = hasLastPage;
	}
	public double getRight() {
		return right;
	}
	public void setRight(double right) {
		this.right = right;
	}
	public double getLeft() {
		return left;
	}
	public void setLeft(double left) {
		this.left = left;
	}

	public int getPageTotal() {
		return pageTotal;
	}

	public void setPageTotal(int pageTotal) {
		this.pageTotal = pageTotal;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

}
