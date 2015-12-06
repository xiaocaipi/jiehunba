package net.jeeshop.services.manage.catalog.bean;import java.io.Serializable;import java.util.List;/** * 商品分类 *  * @author huangf *  */public class Catalog extends net.jeeshop.services.common.Catalog implements		Serializable {	private static final long serialVersionUID = 1L;	private String text;// comboxtree需要显示的文本	private List<Catalog> children;	private boolean open = true;	private String picture;	private int productNum;// 该目录下的商品数量	public boolean isOpen() {		return open;	}	public void setOpen(boolean open) {		this.open = open;	}	public Catalog() {		super();	}	public Catalog(String id, String name) {		super(id, name);	}	public void clear() {		super.clear();		text = null;		if (children != null) {			children.clear();		}		children = null;		productNum = 0;	}	public void setText(String text) {		this.text = text;	}	public int getProductNum() {		return productNum;	}	public void setProductNum(int productNum) {		this.productNum = productNum;	}	public List<Catalog> getChildren() {		return children;	}	public void setChildren(List<Catalog> children) {		this.children = children;	}	public String getPicture() {		return picture;	}	public void setPicture(String picture) {		this.picture = picture;	}		}