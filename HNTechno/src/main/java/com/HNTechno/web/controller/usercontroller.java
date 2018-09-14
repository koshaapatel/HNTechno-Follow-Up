package com.HNTechno.web.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.HNTechno.model.inquiry;

@Controller
public class usercontroller {
	
	@Autowired
	private com.HNTechno.model.Dao.genericDao d;
	
	@Autowired
	ServletContext sc;
	 private static final int BUFFER_SIZE = 4096;
	public File getDirectory() {
		
		String p = sc.getRealPath("/files");
		File f = new File(p);
		return f;
		
	}

	@RequestMapping(value = "home.net", method = RequestMethod.GET)
	public String home(ModelMap models) {
		models.put("list2",d.display("trainingtype"));
		models.put("list8", d.display("Language"));
		return "home";
	}
	@RequestMapping(value = "aboutus.net", method = RequestMethod.GET)
	public String aboutus(ModelMap models) {
		models.put("list2",d.display("trainingtype"));
		models.put("list8", d.display("Language"));
		return "Aboutus";
	}
	@RequestMapping(value = "services.net", method = RequestMethod.GET)
	public String services(ModelMap models) {
		models.put("list2",d.display("trainingtype"));
		models.put("list8", d.display("Language"));
		return "services";
	}

	@RequestMapping(value = "WebDesigning.net", method = RequestMethod.GET)
	public String WebDesigning(ModelMap models) {
		models.put("list2",d.display("trainingtype"));
		models.put("list8", d.display("Language"));
		return "WebDesigning";
	}
	
	@RequestMapping(value = "appdevlop.net", method = RequestMethod.GET)
	public String appdevlop(ModelMap models) {
		models.put("list2",d.display("trainingtype"));
		models.put("list8", d.display("Language"));
		return "appdevlop";
	}
	
	@RequestMapping(value = "technology.net", method = RequestMethod.GET)
	public String technology(ModelMap models) {
		models.put("list2",d.display("trainingtype"));
		models.put("list8", d.display("Language"));
		return "technology";
	}

	@RequestMapping(value = "mobileapp.net", method = RequestMethod.GET)
	public String mobileapp(ModelMap models){
		models.put("list2",d.display("trainingtype"));
		models.put("list8", d.display("Language"));
		return "mobileapp";
	}

	@RequestMapping(value = "userinquiry.net", method = RequestMethod.GET)
	public String userinquiry(ModelMap m) {
		m.put("m1",new inquiry());
		m.put("list8",d.display("Language"));
		m.put("list2",d.display("trainingtype"));
		return "userinquiry";
	}
	@RequestMapping(value = "userinquiry.net", method = RequestMethod.POST)
	public String userinquirys(@ModelAttribute("m1") inquiry i,BindingResult bindingResult,ModelMap m) {
		d.insert(i);
		m.put("m1",new inquiry());
		m.put("list8",d.display("Language"));
		m.put("list2",d.display("trainingtype"));
		return "userinquiry";
	}
	@RequestMapping(value = "tranning.net", method = RequestMethod.GET)
	public String tranning(ModelMap models){
		models.put("list8", d.display("Language"));
		models.put("list2",d.display("trainingtype"));
		return "tranning";
	}
	
	@RequestMapping(value = "directtr.net", method = RequestMethod.GET)
	public String directtr(ModelMap models){
		models.put("list8", d.display("Language"));
		models.put("list2",d.display("trainingtype"));
		return "directtr";
	}
	@RequestMapping(value = "livetr.net", method = RequestMethod.GET)
	public String livetr(ModelMap models){
		models.put("list8", d.display("Language"));
		models.put("list2",d.display("trainingtype"));
		return "livetr";
	}
	@RequestMapping(value = "onlinetr.net", method = RequestMethod.GET)
	public String onlinetr(ModelMap models){
		models.put("list8", d.display("Language"));
		models.put("list2",d.display("trainingtype"));
		return "onlinetr";
	}
	@RequestMapping(value = "userlanguage.net", method = RequestMethod.GET)
	public String userlanguage(ModelMap models){
		models.put("list8", d.display("Language"));
		models.put("list2",d.display("trainingtype"));
		models.put("list9", d.display("sublanguage_master"));
		return "userlanguage";
	}
	@RequestMapping(value = "usermaterial.net", method = RequestMethod.GET)
	public String usermaterial(ModelMap models){
		models.put("list8", d.display("Language"));
		models.put("list2",d.display("trainingtype"));
		models.put("material",d.display("material_master"));
		return "usermaterial";
	}
	@RequestMapping(value = "successtr.net", method = RequestMethod.GET)
	public String successtr(ModelMap models){
		models.put("list8", d.display("Language"));
		models.put("list2",d.display("trainingtype"));
		return "successtr";
	}
	@RequestMapping(value = "contact.net", method = RequestMethod.GET)
	public String contact(ModelMap models){
		models.put("list8", d.display("Language"));
		models.put("list2",d.display("trainingtype"));
		return "contact";
	}
	@RequestMapping(value = "particularlang.net", method = RequestMethod.GET)
	public String particularlang(@RequestParam("id") int id,ModelMap models){
		models.put("li", d.display("sublanguage_master","l.lid = '" + id + "'").get(0));
		models.put("list8",d.display("Language"));
		return "particular";
	}

	@RequestMapping(value = "download1.net", method = RequestMethod.GET)
	public void abc(HttpServletRequest request,
	        HttpServletResponse response,@RequestParam("p") String h) throws IOException{
		// get absolute path of the application
		String path = sc.getRealPath("/files/");

	    // construct the complete absolute path of the file
	    String fullPath = path + h;      
	    File downloadFile = new File(fullPath);
	    FileInputStream inputStream = new FileInputStream(downloadFile);
	     
	    // get MIME type of the file
	    String mimeType = sc.getMimeType(fullPath);
	    if (mimeType == null) {
	        // set to binary type if MIME mapping not found
	        mimeType = "application/octet-stream";
	    }
	    System.out.println("MIME type: " + mimeType);

	    // set content attributes for the response
	    response.setContentType(mimeType);
	    response.setContentLength((int) downloadFile.length());

	    // set headers for the response
	    String headerKey = "Content-Disposition";
	    String headerValue = String.format("attachment; filename=\"%s\"",
	            downloadFile.getName());
	    response.setHeader(headerKey, headerValue);

	    // get output stream of the response
	    OutputStream outStream = response.getOutputStream();

	    byte[] buffer = new byte[BUFFER_SIZE];
	    int bytesRead = -1;

	    // write bytes read from the input stream into the output stream
	    while ((bytesRead = inputStream.read(buffer)) != -1) {
	        outStream.write(buffer, 0, bytesRead);
	    }

	    inputStream.close();
	    outStream.close();
}	
	
	/*@RequestMapping(value = "upload.hn", method = RequestMethod.GET)
	public String material(ModelMap models) {
		models.put("list", g.view("languageModel"));
		models.put("list1", g.view("sublangModel"));
		models.put("material", new mastermaterialModel());

		return "material";*/

}

	




