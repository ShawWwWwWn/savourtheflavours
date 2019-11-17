package com.fdmgroup.util;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.fdmgroup.dao.RecipeDao;
import com.fdmgroup.model.Ingredient;
import com.fdmgroup.model.Recipe;
import com.fdmgroup.model.Unit;
import com.fdmgroup.model.User;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.ExceptionConverter;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfName;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

public class PdfBuilder extends AbstractITextPdfView {
	private RecipeDao recipeDao = new RecipeDao();

	@Override
	protected void buildPdfDocument(Map<String, Object> model, Document document, PdfWriter writer,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		int id = (int) model.get("recipeId");
		
		Recipe foundRecipe = recipeDao.findById(id);
		
		List<String> steps = foundRecipe.getSteps();
		List<Ingredient> ingredients = foundRecipe.getIngredients();
		
		PdfPTable header = new PdfPTable(1);
		header.setWidths(new int[]{100});
		header.setTotalWidth(525);
		header.setLockedWidth(true);
		header.getDefaultCell().setFixedHeight(30);
		header.getDefaultCell().setBorder(Rectangle.BOTTOM);
		header.getDefaultCell().setBorder(Rectangle.TOP);
		header.getDefaultCell().setBorder(Rectangle.RIGHT);
		header.getDefaultCell().setBorder(Rectangle.LEFT);
		header.getDefaultCell().setBorderColor(BaseColor.LIGHT_GRAY);
		header.getDefaultCell().setHorizontalAlignment(Element.ALIGN_LEFT);
		header.addCell(new Phrase(foundRecipe.getTitle() , new Font(Font.FontFamily.TIMES_ROMAN, 16, Font.BOLD)));
		document.add(header);
		
		PdfPTable description = new PdfPTable(1);
		description.setWidths(new int[]{100});
		description.setTotalWidth(525);
		description.setLockedWidth(true);
		description.getDefaultCell().setFixedHeight(50);
		description.getDefaultCell().setHorizontalAlignment(Element.ALIGN_LEFT);
		description.getDefaultCell().setBorder(Rectangle.NO_BORDER);
		description.addCell(new Phrase(foundRecipe.getDescription() , new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.ITALIC)));
		document.add(description);
		
        
		PdfPTable ingredientHeader = new PdfPTable(1);
		ingredientHeader.setWidths(new int[]{100});
		ingredientHeader.setTotalWidth(525);
		ingredientHeader.setLockedWidth(true);
		ingredientHeader.getDefaultCell().setFixedHeight(25);
		ingredientHeader.getDefaultCell().setHorizontalAlignment(Element.ALIGN_LEFT);
		ingredientHeader.getDefaultCell().setBorder(Rectangle.NO_BORDER);
		ingredientHeader.addCell(new Phrase("Ingredients:" , new Font(Font.FontFamily.TIMES_ROMAN, 14, Font.BOLD)));
		document.add(ingredientHeader);
		
		for (Ingredient ingredient : foundRecipe.getIngredients()) {
			document.add(new Paragraph(ingredient.getName() + ":" + ingredient.getQuantity() + " " + ingredient.getUnit()));
		}
		
		PdfPTable space = new PdfPTable(1);
		space.setWidths(new int[]{100});
		space.setTotalWidth(525);
		space.setLockedWidth(true);
		space.getDefaultCell().setFixedHeight(25);
		space.getDefaultCell().setHorizontalAlignment(Element.ALIGN_LEFT);
		space.getDefaultCell().setBorder(Rectangle.NO_BORDER);
		space.addCell(new Phrase("", new Font(Font.FontFamily.TIMES_ROMAN, 14, Font.BOLD)));
		document.add(space);
		
		PdfPTable directionsHeader = new PdfPTable(1);
		directionsHeader.setWidths(new int[]{100});
		directionsHeader.setTotalWidth(525);
		directionsHeader.setLockedWidth(true);
		directionsHeader.getDefaultCell().setFixedHeight(25);
		directionsHeader.getDefaultCell().setHorizontalAlignment(Element.ALIGN_LEFT);
		directionsHeader.getDefaultCell().setBorder(Rectangle.NO_BORDER);
		directionsHeader.addCell(new Phrase("Directions:" , new Font(Font.FontFamily.TIMES_ROMAN, 14, Font.BOLD)));
		document.add(directionsHeader);
		
		int i =1;
		for (String step : foundRecipe.getSteps()) {
			document.add( new Paragraph(i++ + ". " +step));
			document.add( new Paragraph(" "));
		}
		
		PdfPTable footer = new PdfPTable(1);
	    try {

	        footer.setWidths(new int[]{100});
	        footer.setTotalWidth(527);
	        footer.setLockedWidth(false);
	        footer.getDefaultCell().setFixedHeight(40);
	        footer.getDefaultCell().setBorder(Rectangle.TOP);
	        footer.getDefaultCell().setBorderColor(BaseColor.LIGHT_GRAY);

	        footer.getDefaultCell().setHorizontalAlignment(Element.ALIGN_LEFT);
	        footer.addCell(new Phrase("SavourTheFlavours" + "\n" + "Recipe By: " + foundRecipe.getUser().getfName() + " " +  foundRecipe.getUser().getlName(), new Font(Font.FontFamily.HELVETICA, 10, Font.ITALIC)));

	        
	        // write page
	        PdfContentByte canvas = writer.getDirectContent();
	        canvas.beginMarkedContentSequence(PdfName.ARTIFACT);
	        footer.writeSelectedRows(0, -1, 34, 50, canvas);
	        canvas.endMarkedContentSequence();
	    } catch(DocumentException de) {
	        throw new ExceptionConverter(de);
	    }
		
		
         
    }
		
		

}
