package com.xymsy.service;

import java.io.File;

import com.xymsy.entity.Certification;
import com.xymsy.entity.Store;
import com.xymsy.entity.User;
import com.xymsy.util.ServiceResult;

/**
 * 功能服务，收藏，关注，评论，实名认证
 * @author Administrator
 *
 */
public interface IFunctionService {
	
	/**
	 * 获取实名认证状态
	 * @return
	 */
	public ServiceResult getCertificationStatu(User user); 
	
	/**
	 * 获取店铺状态
	 * @return
	 */
	public ServiceResult getStoreStatu(User user);
	
	/**
	 * 实名认证
	 * @return
	 */
	public ServiceResult certification(Certification cer);
	
	/**
	 * 申请开店
	 * @return
	 */
	public ServiceResult applyShop(Store store);
	
	/**
	 * 上传图片
	 * @param file		文件
	 * @param fileName	文件名
	 * @param ext		文件拓展名
	 * @param no		id
	 * @return 成功返回图片路径，失败返回#
	 */
	public String uploadPicture(File file, String fileName, String ext,String no);
	
}
