package com.fdmgroup.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

@Entity
public class ImageFile {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	@SequenceGenerator (name = "IMG_GNTR", sequenceName = "IMG_ID_SEQ")
	private int id;
	
	private String fileName;
	
	private byte[] data;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "FK_RECIPE_ID")
	private Recipe recipe;

	public ImageFile() {
		super();
	}

	public ImageFile(String fileName, byte[] data) {
		super();
		this.fileName = fileName;
		this.data = data;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public byte[] getData() {
		return data;
	}

	public void setData(byte[] data) {
		this.data = data;
	}

	public Recipe getRecipe() {
		return recipe;
	}

	public void setRecipe(Recipe recipe) {
		this.recipe = recipe;
	}

}
