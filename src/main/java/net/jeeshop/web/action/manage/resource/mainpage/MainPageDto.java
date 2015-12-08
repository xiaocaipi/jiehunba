package net.jeeshop.web.action.manage.resource.mainpage;

import java.util.List;

import net.jeeshop.services.manage.catalog.bean.Catalog;
import net.jeeshop.services.manage.indexImg.bean.IndexImg;

public class MainPageDto {
	
	private List<IndexImg> indexImgList ;
	
	private List<Catalog> catalogList;
	
	private String resultStatus;

	public List<IndexImg> getIndexImgList() {
		return indexImgList;
	}

	public void setIndexImgList(List<IndexImg> indexImgList) {
		this.indexImgList = indexImgList;
	}

	public List<Catalog> getCatalogList() {
		return catalogList;
	}

	public void setCatalogList(List<Catalog> catalogList) {
		this.catalogList = catalogList;
	}

	public String getResultStatus() {
		return resultStatus;
	}

	public void setResultStatus(String resultStatus) {
		this.resultStatus = resultStatus;
	}
	
	
	

	
}
