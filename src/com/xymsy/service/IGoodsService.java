package com.xymsy.service;

import java.io.File;

import com.xymsy.entity.Goods;
import com.xymsy.util.PageMsg;
import com.xymsy.util.ServiceResult;

/**
 * 商品
 * @author Administrator
 *
 */
public interface IGoodsService {
	
	/**
	 * 获取商品显示列表----目前默认按销量排序
	 * @return
	 */
	public ServiceResult getGoodsList(Goods goods, PageMsg msg);
	
	/**
	 * 获取商品列表----按价格排序从低到高
	 * @return
	 */
	public ServiceResult getGoodsListOrderPriceT(Goods goods, PageMsg msg);
	
	/**
	 * 获取商品列表----按价格排序从高到低
	 * @return
	 */
	public ServiceResult getGoodsListOrderPriceF(Goods goods, PageMsg msg);
	
	/**
	 * 获取商品详细信息
	 * @param goods
	 * @param msg
	 * @return
	 */
	public ServiceResult getGoodsInfo(Goods goods,PageMsg msg);
	
	/**
	 * 获得所有商品信息
	 * @return
	 * @time 2015-1-9-21:30
	 */
	public ServiceResult getAllGoods();
	
	
	
	
	
	
	/**
	 * 添加商品
	 * @param goods
	 * @return
	 */
	public ServiceResult addGoods(Goods goods);
	
	/**
	 * 获取该店铺里面的商品列表
	 * @param goods
	 * @return
	 */
	public ServiceResult getStoreGoodsList(Goods goods, PageMsg msg);
	
	/**
	 * 在添加商品的时候添加商品图片
	 * @param goods
	 * @param file
	 * @param fileName
	 * @param contentType
	 * @param id
	 * @return
	 */
	public ServiceResult addGoodsPicture(Goods goods, File file, String fileName, String contentType, Integer id);
	
	/**
	 * 上传商品图片
	 * @param file 文件
	 * @param fileName 文件名
	 * @param ext 文件扩展名
	 * @param no 文件要存成什么名字
	 * @return
	 */
	public String uploadpicture(File file, String fileName, String ext,String no);

	/**
	 * 改变商品状态
	 * @param goodsId 商品id
	 * @param aimStatu 商品要改变成什么状态
	 * @return
	 */
	public ServiceResult deleteGoods(Integer goodsId, String aimStatu);
}
