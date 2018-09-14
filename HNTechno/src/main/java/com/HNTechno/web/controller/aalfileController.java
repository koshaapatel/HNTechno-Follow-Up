
package com.HNTechno.web.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.HNTechno.model.Inquiry_follow;
import com.HNTechno.model.Language;
import com.HNTechno.model.appointment;
import com.HNTechno.model.batchdetails;
import com.HNTechno.model.city_details;
import com.HNTechno.model.city_master;
import com.HNTechno.model.college_details;
import com.HNTechno.model.college_master;
import com.HNTechno.model.country;
import com.HNTechno.model.email;
import com.HNTechno.model.faculty;
import com.HNTechno.model.field;
import com.HNTechno.model.inquiry;
import com.HNTechno.model.inquiry_details;
import com.HNTechno.model.material_details;
import com.HNTechno.model.material_master;
import com.HNTechno.model.state_details;
import com.HNTechno.model.state_master;
import com.HNTechno.model.student_coursedetails_details;
import com.HNTechno.model.sublanguage_details;
import com.HNTechno.model.sublanguage_master;
import com.HNTechno.model.trainingtype;
import com.HNTechno.model.university;
import com.HNTechno.model.video_details;
import com.HNTechno.model.video_master;
import com.HNTechno.model.Dao.genericDao;
import com.sun.mail.handlers.multipart_mixed;

@Controller
public class aalfileController {

	@Autowired
	genericDao d;
	@Autowired
	ServletContext sc;
	 private static final int BUFFER_SIZE = 4096;
	public File getDirectory() {
		
		String p = sc.getRealPath("/files");
		File f = new File(p);
		return f;
		
	}
	
	@RequestMapping(value = "editprofile.net", method = RequestMethod.GET)
	public String editprofile(ModelMap m,@RequestParam("id") int id) {
		m.put("l",d.display("login","uid='"+id+"'").get(0));
		return "editprofile";
	}
	@RequestMapping(value = "editprofile.net", method = RequestMethod.POST)
	public String editprofile(@ModelAttribute("l") com.HNTechno.model.login l1,@RequestParam("id") int id,@RequestParam("role") String role,@RequestParam("image") String i, ModelMap m) {
		l1.setRole(role);
		l1.setUid(id);
		l1.setImage(i);
		d.insert(l1);
		email.send(l1.getEmail(),"Regarding Registration","Your Username is \n"+l1.getUsername()+"\nand\n"+"Your Password is \n"+l1.getPassword());
		return "welcome";
	}
	@RequestMapping(value = "forgot.net", method = RequestMethod.POST)
	public String forgot(HttpSession s,ModelMap m,@RequestParam("email") String e) {
		try{
		com.HNTechno.model.login l = (com.HNTechno.model.login)d.display("login","email='"+e+"'").get(0);
		email.send(l.getEmail(),"Regarding Forgot Username or Password","Your Username is \n"+l.getUsername()+"\nand\n"+"Your Password is \n"+l.getPassword());
		}
		catch(Exception a){
			return "redirect:/forgoterror.net";
		}
		return "login";
	}
	@RequestMapping(value = "/forgoterror.net", method = RequestMethod.GET)
	public String forgoterror(ModelMap m) {
		m.put("msg","Sorry Email Id Not Exist !!");
		return "login";
	}
	@RequestMapping(value="index.net",method=RequestMethod.GET)
	public String xyz(Principal p,HttpSession s){
		System.out.println("meet");
		com.HNTechno.model.login l = (com.HNTechno.model.login)d.display("login","username='"+p.getName()+"'").get(0);
		s.setAttribute("uname",l.getUsername());
		s.setAttribute("image",l.getImage());
		s.setAttribute("name",l.getName());
		s.setAttribute("role",l.getRole());
		s.setAttribute("uid",l.getUid());
		return "welcome";
	}
	@RequestMapping(value = "login.net", method = RequestMethod.GET)
	public String login(HttpServletResponse response,HttpSession ses, HttpServletRequest request, HttpSession s, Principal principal,
			com.HNTechno.model.login l) {
		try {

			response.setHeader("Cache-Control", "no-cache");
			response.setHeader("Cache-Control", "no-store");
			response.setHeader("Pragma", "no-cache");
			response.setDateHeader("Expires", 0);
			ses.invalidate();
			return "login";
		} catch (Exception e) {
			return "redirect:/loginerror.net";
		}
	}
	@RequestMapping(value = "/loginerror.net", method = RequestMethod.GET)
	public String loginError(ModelMap m) {
		m.put("msg","Invalid Username & password !!");
		return "login";
	}
	@RequestMapping(value="error.net",method=RequestMethod.GET)
	public String xyz1(){
		return "error";
	}
	@RequestMapping(value="AddLang.net",method=RequestMethod.GET)
	public String xyz1(ModelMap m){
		m.put("m1",new Language());
		m.put("list",d.display("Language"));
		return "lang";
	}
	@RequestMapping(value="AddLang.net",method=RequestMethod.POST)
	public String xyz1(@ModelAttribute("m1") Language l,BindingResult bindingResult,ModelMap m){
		d.insert(l);
		m.put("list",d.display("Language"));
		return "lang";
	}
	@RequestMapping(value="delete.net",method=RequestMethod.POST)
	public String xyz2(@RequestParam("id") int id1,ModelMap m){
		try{
		Language l = new Language(id1);
		d.delete(l);
		m.put("m1",new Language());
		m.put("list",d.display("Language"));
		return "lang";
		}
		catch(Exception e){
			return "redirect:/error.net";
		}
	}
	@RequestMapping(value="update.net",method=RequestMethod.POST)
	public String xyz11(@RequestParam("id") int id2,@RequestParam("lang") String lang,@RequestParam("title") String t,ModelMap m){
		Language l = new Language(id2, lang, t);
		l.setActive_flag(0);
		d.insert(l);
		m.put("m1",new Language());
		m.put("list",d.display("Language"));
		return "lang";
	}
	@RequestMapping(value="remove.net",method=RequestMethod.POST)
	public String xyz3(@RequestParam("id") int id1,ModelMap m){
		Language l =(Language) d.display("Language","lid = '" + id1+ "'").get(0);
		l.setActive_flag(1);
		d.insert(l);
		m.put("m1",new Language());
		m.put("list",d.display("Language"));
		return "lang";
	}
	@RequestMapping(value="retrieve.net",method=RequestMethod.POST)
	public String xyz4(@RequestParam("id") int id1,ModelMap m){
		Language l =(Language) d.display("Language","lid = '" + id1+ "'").get(0);
		l.setActive_flag(0);
		d.insert(l);
		m.put("m1",new Language());
		m.put("list",d.display("Language"));
		return "lang";
	}
	@RequestMapping(value="AddsubLang.net",method=RequestMethod.GET)
	public String xyz2(ModelMap m){
		m.put("m2",new sublanguage_master());
		m.put("list1",d.display("Language"));
		m.put("list",d.display("sublanguage_master"));
		return "sublang";
	}
	@RequestMapping(value="AddsubLang.net",method=RequestMethod.POST)
	public String xyz2(@ModelAttribute("m2") sublanguage_master s,@RequestParam("sublang") String[] sl,@RequestParam("title") String[] t,@RequestParam("fees") int[] f,@RequestParam("course") String[] c,ModelMap m) throws IOException{
		try{
		s = d.insert(s);
		for (int i = 0; i < sl.length; i++) {
		sublanguage_details s1 = new sublanguage_details(sl[i], t[i], f[i], c[i], s);
		d.insert(s1);	
		}
		}
		catch(Exception e){
			return "redirect:/error.net";
		}
		
		m.put("m2",new sublanguage_master());
		m.put("list1",d.display("Language"));
		m.put("list",d.display("sublanguage_master"));
		return "sublang";
	}
	@RequestMapping(value="material.net",method=RequestMethod.GET)
	public String xyz3(ModelMap m){
		m.put("m1",new material_master());
		m.put("list",d.display("material_master"));
		m.put("list1",d.display("Language"));
		m.put("list2",d.display("sublanguage_details"));
		return "material";
	}
	@RequestMapping(value="material.net",method=RequestMethod.POST)
	public String xyz3(@ModelAttribute("m1") material_master mm,BindingResult bu,@RequestParam("mname") String[] m1,@RequestParam("title") String[] t,@RequestParam("file") MultipartFile[] f,HttpServletRequest req,HttpServletResponse res,ModelMap m){
		try{
			if(f!=null){
			mm =	d.insert(mm);
				for (int i = 0; i < t.length; i++) {
					f[i].transferTo(new File(getDirectory(),f[i].getOriginalFilename()));
					material_details md = new material_details(m1[i],t[i], f[i].getOriginalFilename(), mm);
					d.insert(md);
				}
			}
		}
		catch (Exception e) {
			System.out.println(e);
		}
		m.put("m1",new material_master());
		m.put("list",d.display("material_master"));
		m.put("list1",d.display("Language"));
		m.put("list2",d.display("sublanguage_details"));
		return "material";
	}
	@RequestMapping(value = "download.net", method = RequestMethod.GET)
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
	@RequestMapping(value="video.net",method=RequestMethod.GET)
	public String xyz4(ModelMap m){
		m.put("m2",new video_master());
		m.put("list",d.display("video_master"));
		m.put("list1",d.display("Language"));
		m.put("list2",d.display("sublanguage_details"));
		return "video";
	}
	@RequestMapping(value="video.net",method=RequestMethod.POST)
	public String xyz31(@ModelAttribute("m2") video_master vm,@RequestParam("vname") String[] v1,@RequestParam("title") String[] t,@RequestParam("file") MultipartFile[] f,HttpServletRequest req,HttpServletResponse res,ModelMap m){
		try{
			if(f!=null){
			vm =	d.insert(vm);
				for (int i = 0; i < t.length; i++) {
					f[i].transferTo(new File(getDirectory(),f[i].getOriginalFilename()));
					video_details vd = new video_details(v1[i],t[i], f[i].getOriginalFilename(), vm);
					d.insert(vd);
				}
			}
		}
		catch (Exception e) {
			System.out.println(e);
		}
		m.put("m2",new video_master());
		m.put("list",d.display("video_master"));
		m.put("list1",d.display("Language"));
		m.put("list2",d.display("sublanguage_details"));
		return "video";
	}
	@RequestMapping(value="delete1.net",method=RequestMethod.POST)
	public String xyz5(@RequestParam("id") int id1,ModelMap m){
		sublanguage_details sd = (sublanguage_details)d.display("sublanguage_details","sdid='"+id1+"'").get(0);
		sd.setActive_flag(1);
		d.insert(sd);
		m.put("m2",new sublanguage_master());
		m.put("list",d.display("sublanguage_master"));
		return "sublang";
	}
	@RequestMapping(value="retrieve1.net",method=RequestMethod.POST)
	public String retrieve(@RequestParam("id") int id1,ModelMap m){
		sublanguage_details sd = (sublanguage_details)d.display("sublanguage_details","sdid='"+id1+"'").get(0);
		sd.setActive_flag(0);
		d.insert(sd);
		m.put("m2",new sublanguage_master());
		m.put("list",d.display("sublanguage_master"));
		return "sublang";
	}
	@RequestMapping(value="delete2.net",method=RequestMethod.POST)
	public String xyz6(@RequestParam("id") int id1,ModelMap m){
		sublanguage_master sm = new sublanguage_master(id1);
		d.delete(sm);
		m.put("m2",new sublanguage_master());
		m.put("list",d.display("sublanguage_master"));
		return "sublang";
	}
	@RequestMapping(value="update1.net",method=RequestMethod.POST)
	public String xyz12(@RequestParam("id") int id2,@RequestParam("slang") String slang,ModelMap m){
		sublanguage_details sd = new sublanguage_details(id2,slang);
		d.insert(sd);
		m.put("m1",new sublanguage_master());
		m.put("list",d.display("sublanguage_master"));
		return "sublang";
	}
	@RequestMapping(value="inquiry.net",method=RequestMethod.GET)
	public String xyz5(ModelMap m){
		m.put("list",d.display("inquiry"));
		m.put("list1",d.display("sublanguage_master"));
		m.put("list2",d.display("trainingtype"));
		m.put("list3",d.display("college_master"));
		m.put("list4",d.display("city_master"));
		m.put("list5",d.display("state_master"));
		m.put("list6",d.display("Inquiry_follow"));
		m.put("list7",d.display("faculty"));
		m.put("list8",d.display("Language"));
		m.put("list12", d.display("appointment"));
		return "inquiry";
	}
	@RequestMapping(value="addinquiry.net",method=RequestMethod.GET)
	public String xyz12(ModelMap m){
		/*inquiry i = new inquiry();
		i.setImid(d.getid()+1);
		*/m.put("m1",new inquiry());
		m.put("list",d.display("inquiry"));
		m.put("list1",d.display("sublanguage_master"));
		m.put("list2",d.display("trainingtype"));
		m.put("list3",d.display("college_master"));
		m.put("list4",d.display("city_master"));
		m.put("list5",d.display("state_master"));
		m.put("list6",d.display("Inquiry_follow"));
		m.put("list7",d.display("faculty"));
		m.put("list8",d.display("Language"));
		m.put("list9", d.display("university"));
		m.put("list10", d.display("country"));
		m.put("list11", d.display("field"));
		m.put("list12", d.display("appointment"));
		m.put("list13", d.display("batchdetails"));
		return "addinquiry";
	}
	@RequestMapping(value="addinquiry.net",method=RequestMethod.POST)
	public String xyz1(@ModelAttribute("m1") inquiry i1,BindingResult b,ModelMap m){
		i1 = d.insert(i1);
		m.put("list",d.display("inquiry"));
		m.put("list1",d.display("sublanguage_master"));
		m.put("list2",d.display("trainingtype"));
		m.put("list3",d.display("college_master"));
		m.put("list4",d.display("city_master"));
		m.put("list5",d.display("state_master"));
		m.put("list6",d.display("Inquiry_follow"));
		m.put("list7",d.display("faculty"));
		m.put("list8",d.display("Language"));
		m.put("list9", d.display("university"));
		m.put("list10", d.display("country"));
		m.put("list11", d.display("field"));
		m.put("list12", d.display("appointment"));
		m.put("list13", d.display("batchdetails"));
		return "inquiry";
	}
	@RequestMapping(value="addfollowstatus.net",method=RequestMethod.POST)
	public String xyz20(@RequestParam("follow") String f,@RequestParam("id") int id2,ModelMap m){
		Inquiry_follow i1 = new Inquiry_follow();
		inquiry i = new inquiry();
		i.setImid(id2);
		i1.setIm(i);
		i1.setFollowdetails(f);
		d.insert(i1);
		m.put("list",d.display("inquiry"));
		m.put("list1",d.display("sublanguage_master"));
		m.put("list2",d.display("trainingtype"));
		m.put("list3",d.display("college_master"));
		m.put("list4",d.display("city_master"));
		m.put("list5",d.display("state_master"));
		m.put("list6",d.display("Inquiry_follow"));
		m.put("list7",d.display("faculty"));
		m.put("list8",d.display("Language"));
		m.put("list9", d.display("university"));
		m.put("list10", d.display("country"));
		m.put("list11", d.display("field"));
		m.put("list12", d.display("appointment"));
		m.put("list13", d.display("batchdetails"));
		return "inquiry";
	}
	@RequestMapping(value="cancelinquiry.net",method=RequestMethod.POST)
	public String xyz8(@RequestParam("id") int id1,ModelMap m){
		inquiry i =(inquiry) d.display("inquiry","imid = '" + id1+ "'").get(0);
		i.setActive_flag(1);
		d.insert(i);
		m.put("list",d.display("inquiry"));
		m.put("list1",d.display("sublanguage_master"));
		m.put("list2",d.display("trainingtype"));
		m.put("list3",d.display("college_master"));
		m.put("list4",d.display("city_master"));
		m.put("list5",d.display("state_master"));
		m.put("list6",d.display("Inquiry_follow"));
		m.put("list7",d.display("faculty"));
		m.put("list8",d.display("Language"));
		m.put("list9", d.display("university"));
		m.put("list10", d.display("country"));
		m.put("list11", d.display("field"));
		m.put("list12", d.display("appointment"));
		m.put("list13", d.display("batchdetails"));
		return "inquiry";
	}
	@RequestMapping(value="retrieveinquiry.net",method=RequestMethod.POST)
	public String xyz15(@RequestParam("id") int id1,ModelMap m){
		inquiry i =(inquiry) d.display("inquiry","imid = '" + id1+ "'").get(0);
		i.setActive_flag(0);
		d.insert(i);
		m.put("list",d.display("inquiry"));
		m.put("list1",d.display("sublanguage_master"));
		m.put("list2",d.display("trainingtype"));
		m.put("list3",d.display("college_master"));
		m.put("list4",d.display("city_master"));
		m.put("list5",d.display("state_master"));
		m.put("list6",d.display("Inquiry_follow"));
		m.put("list7",d.display("faculty"));
		m.put("list8",d.display("Language"));
		m.put("list9", d.display("university"));
		m.put("list10", d.display("country"));
		m.put("list11", d.display("field"));
		m.put("list12", d.display("appointment"));
		m.put("list13", d.display("batchdetails"));
		return "inquiry";
	}
	@RequestMapping(value="addappointment.net",method=RequestMethod.POST)
	public String xyz20(@RequestParam("language") String l,@RequestParam("remark") String r,@RequestParam("faculty") String f,@RequestParam("date") String d1,@RequestParam("id") int id2,ModelMap m) throws ParseException{
		SimpleDateFormat s = new SimpleDateFormat("dd-MM-yyyy");
		Date dd = s.parse(d1);
		inquiry i = new inquiry();
		i.setImid(id2);
		Language l1 = new Language();
		l1.setLid(Integer.parseInt(l));
		faculty f1 = new faculty();
		f1.setFacultyid(Integer.parseInt(f));
		appointment a = new appointment(dd, r, i, l1, f1);
		d.insert(a);
		a.setActive_flag(1);
		d.insert(a);
		m.put("list",d.display("inquiry"));
		m.put("list1",d.display("sublanguage_master"));
		m.put("list2",d.display("trainingtype"));
		m.put("list3",d.display("college_master"));
		m.put("list4",d.display("city_master"));
		m.put("list5",d.display("state_master"));
		m.put("list6",d.display("Inquiry_follow"));
		m.put("list7",d.display("faculty"));
		m.put("list8",d.display("Language"));
		m.put("list9", d.display("university"));
		m.put("list10", d.display("country"));
		m.put("list11", d.display("field"));
		m.put("list12", d.display("appointment"));
		return "inquiry";
	}
	@RequestMapping(value="studentregistration.net",method=RequestMethod.GET)
	public String xyz15(ModelMap m,@RequestParam("id") int id2){
		m.put("im",d.display("inquiry","imid='"+id2+"'").get(0));
		m.put("list1",d.display("country"));
		m.put("list2",d.display("field"));
		m.put("list3",d.display("city_details"));
		m.put("list4",d.display("state_master"));
		m.put("list5",d.display("sublanguage_details"));
		m.put("list6",d.display("inquiry_details"));
		m.put("list7",d.display("college_details"));
		m.put("list8",d.display("Language"));
		m.put("list9", d.display("university"));
		m.put("ttype",d.display("trainingtype"));
		m.put("batch",d.display("batchdetails"));
		return "addregistration";
	}
	@RequestMapping(value="studentregistration.net",method=RequestMethod.POST)
	public String xyz15(ModelMap m,@RequestParam("sublang") String[] sublang,@ModelAttribute("im") inquiry i,BindingResult b){
		for (int j = 0; j < sublang.length; j++) {
			sublanguage_details sd = new sublanguage_details();
			sd.setSdid(Integer.parseInt(sublang[j]));
			student_coursedetails_details scd = new student_coursedetails_details();
			scd.setSd(sd);
			d.insert(scd);
		}
		d.insert(i);
		m.put("list",d.display("inquiry"));
		m.put("list1",d.display("sublanguage_master"));
		m.put("list2",d.display("trainingtype"));
		m.put("list3",d.display("college_master"));
		m.put("list4",d.display("city_master"));
		m.put("list5",d.display("state_master"));
		m.put("list6",d.display("Inquiry_follow"));
		m.put("list7",d.display("faculty"));
		m.put("list8",d.display("Language"));
		m.put("list9", d.display("university"));
		m.put("list10", d.display("country"));
		m.put("list11", d.display("field"));
		m.put("list12", d.display("appointment"));
		return "inquiry";
	}
	@RequestMapping(value="facultydetails.net",method=RequestMethod.GET)
	public String xyz16(ModelMap m){
		m.put("list",d.display("faculty"));
		return "facultydetails";
	}
	@RequestMapping(value="addfacultydetails.net",method=RequestMethod.GET)
	public String xyz17(ModelMap m){
		m.put("m1",new faculty());
		m.put("list",d.display("faculty"));
		m.put("list1",d.display("Language"));
		m.put("list2",d.display("sublanguage_details"));
		return "addfacultydetails";
	}
	@RequestMapping(value="addfacultydetails.net",method=RequestMethod.POST)
	public String xyz12(@RequestParam("role") String role,@RequestParam("password") String password,@RequestParam("username") String username,@RequestParam("emailid") String emailid,@RequestParam("facultyname") String facultyname,@RequestParam("facultyimage") MultipartFile facultyimage,@RequestParam("facultyfile") MultipartFile facultyfile,@ModelAttribute("m1") faculty f1,BindingResult b,ModelMap m) throws IllegalStateException, IOException{
		facultyimage.transferTo(new File(getDirectory(),facultyimage.getOriginalFilename()));
		facultyfile.transferTo(new File(getDirectory(),facultyfile.getOriginalFilename()));
		f1.setFacultyfile(facultyfile.getOriginalFilename());
		f1.setFacultyimage(facultyimage.getOriginalFilename());
		d.insert(f1);
		com.HNTechno.model.login l = new com.HNTechno.model.login(role, username, password, emailid, facultyimage.getOriginalFilename(), facultyname);
		d.insert(l);
		email.send(f1.getEmailid(),"Regarding Registration","Your Username is \n"+f1.getUsername()+"\nand\n"+"Your Password is \n"+f1.getPassword());
		m.put("m1",new faculty());
		m.put("list",d.display("faculty"));
		m.put("list1",d.display("Language"));
		m.put("list2",d.display("sublanguage_details"));
		return "facultydetails";
	}
	@RequestMapping(value="removefaculty.net",method=RequestMethod.POST)
	public String removefaculty(ModelMap m,@RequestParam("id") int id){
		faculty f = (faculty)d.display("faculty","facultyid='"+id+"'");
		f.setActive_flag(1);
		d.insert(f);
		m.put("m1",new faculty());
		m.put("list",d.display("faculty"));
		m.put("list1",d.display("Language"));
		m.put("list2",d.display("sublanguage_details"));
		return "facultydetails";
	}
	@RequestMapping(value="retrievefaculty.net",method=RequestMethod.POST)
	public String rretrievefaculty(ModelMap m,@RequestParam("id") int id){
		faculty f = (faculty)d.display("faculty","facultyid='"+id+"'");
		f.setActive_flag(0);
		d.insert(f);
		m.put("m1",new faculty());
		m.put("list",d.display("faculty"));
		m.put("list1",d.display("Language"));
		m.put("list2",d.display("sublanguage_details"));
		return "facultydetails";
	}
	@RequestMapping(value="batchdetails.net",method=RequestMethod.GET)
	public String xyz18(ModelMap m){
		m.put("m2",new batchdetails());
		m.put("list",d.display("batchdetails"));
		m.put("list1",d.display("Language"));
		m.put("list2",d.display("faculty"));
		return "batchdetails";
	}
	@RequestMapping(value="batchdetails.net",method=RequestMethod.POST)
	public String xyz18(@RequestParam("sdate") String sdate,@RequestParam("edate") String edate ,@ModelAttribute("m2") batchdetails bd,BindingResult bindingResult,ModelMap m) throws ParseException{
		SimpleDateFormat sd = new SimpleDateFormat("dd-MM-yyyy");
		Date d1 = sd.parse(sdate);
		Date d2 = sd.parse(edate);
		bd.setEdate(d2);
		bd.setSdate(d1);
		d.insert(bd);
		m.put("m2",new batchdetails());
		m.put("list",d.display("batchdetails"));
		m.put("list1",d.display("Language"));
		m.put("list2",d.display("faculty"));
		return "batchdetails";
	}
	/*@RequestMapping(value="createbatch.net",method=RequestMethod.GET)
	public String xyz19(ModelMap m){
		m.put("m2",new createbatch_master());
		m.put("list",d.display("createbatch_master"));
		m.put("list1",d.display("faculty"));
		m.put("list2",d.display("batchdetails"));
		m.put("list4",d.display("sublanguage_details"));
		m.put("list3",d.display("student_details"));
		return "createbatch";
	}*/
	/*@RequestMapping(value="createbatch.net",method=RequestMethod.POST)
	public String xyz18(@ModelAttribute("m2") createbatch_master bm,@RequestParam("students") student_details[] s,ModelMap m){
		bm	= d.insert(bm);
		for (int i = 0; i < s.length; i++) {
			createbatch_details bd = new createbatch_details(s, bm);
		}
		m.put("m2",new batchdetails());
		m.put("list",d.display("batchdetails"));
		m.put("list1",d.display("Language"));
		m.put("list2",d.display("sublanguage_details"));
		return "createbatch";
	}*/
	
	@RequestMapping(value="addlang.net",method=RequestMethod.POST)
	public String xyz1(@RequestParam("lang") String lang,@RequestParam("title") String  t,ModelMap m){
		Language l = new Language(lang, t);
		d.insert(l);
		m.put("m1",new inquiry());
		m.put("list",d.display("inquiry_master"));
		m.put("list1",d.display("Language"));
		m.put("list2",d.display("trainingtype"));
		m.put("list3",d.display("college_master"));
		m.put("list4",d.display("city_master"));
		m.put("list5",d.display("state_master"));
		m.put("list6",d.display("country"));
		return "addinquiry";
	}
	@RequestMapping(value="addcountry.net",method=RequestMethod.POST)
	public String xyz1(@RequestParam("country") String cont,ModelMap m){
		country c = new country(cont);
		d.insert(c);
		m.put("m1",new inquiry());
		m.put("list",d.display("inquiry_master"));
		m.put("list1",d.display("Language"));
		m.put("list2",d.display("trainingtype"));
		m.put("list3",d.display("college_master"));
		m.put("list4",d.display("city_master"));
		m.put("list5",d.display("state_master"));
		m.put("list6",d.display("country"));
		return "addinquiry";
	}
	@RequestMapping(value="addstate.net",method=RequestMethod.POST)
	public String xyz(@ModelAttribute("m2") state_master sm,@RequestParam("state") String  s1,ModelMap m){
		sm = d.insert(sm);
		state_details sd = new state_details(s1, sm);
		d.insert(sd);
		m.put("m1",new inquiry());
		m.put("m2",new state_master());
		m.put("list",d.display("inquiry_master"));
		m.put("list1",d.display("Language"));
		m.put("list2",d.display("trainingtype"));
		m.put("list3",d.display("college_master"));
		m.put("list4",d.display("city_master"));
		m.put("list5",d.display("state_master"));
		m.put("list6",d.display("country"));
		return "addinquiry";
	}
	@RequestMapping(value="addtraining.net",method=RequestMethod.POST)
	public String xyz(@RequestParam("ttype") String ttype,BindingResult bindingResult,ModelMap m){
		trainingtype t = new trainingtype(ttype);
		d.insert(t);
		m.put("list2",d.display("trainingtype"));
		return "inquiry";
	}
	@RequestMapping(value="Addcountry.net",method=RequestMethod.GET)
	public String xyz(ModelMap m){
		m.put("m1",new country());
		m.put("list",d.display("country"));
		return "country";
	}
	@RequestMapping(value="Addcountry.net",method=RequestMethod.POST)
	public String xyz(@ModelAttribute("m1") country c,BindingResult bindingResult,ModelMap m){
		d.insert(c);
		m.put("list",d.display("country"));
		return "country";
	}
	@RequestMapping(value="deletecountry.net",method=RequestMethod.POST)
	public String xyz7(@RequestParam("id") int id1,ModelMap m){
		try{
		country c = new country(id1);
		d.delete(c);
		m.put("m1",new country());
		m.put("list",d.display("country"));
		return "country";
		}
		catch(Exception e){
			return "redirect:/error.net";
		}
	}
	@RequestMapping(value="updatecountry.net",method=RequestMethod.POST)
	public String xyz11(@RequestParam("id") int id2,@RequestParam("country") String country,ModelMap m){
		country c = new country(id2,country);
		d.insert(c);
		m.put("m1",new country());
		m.put("list",d.display("country"));
		return "country";
	}
	@RequestMapping(value="removecountry.net",method=RequestMethod.POST)
	public String xyz(@RequestParam("id") int id1,ModelMap m){
		country c = (country)d.display("country","countryid = '" + id1+ "'").get(0);
		c.setActive_flag(1);
		d.insert(c);
		m.put("m1",new country());
		m.put("list",d.display("country"));
		return "country";
	}
	@RequestMapping(value="retrievecountry.net",method=RequestMethod.POST)
	public String xyz1(@RequestParam("id") int id1,ModelMap m){
		country c =(country)d.display("country","countryid = '" + id1+ "'").get(0);
		c.setActive_flag(0);
		d.insert(c);
		m.put("m1",new country());
		m.put("list",d.display("country"));
		return "country";
	}
	@RequestMapping(value="Addstate.net",method=RequestMethod.GET)
	public String xyz6(ModelMap m){
		m.put("m1",new state_master());
		m.put("list",d.display("state_master"));
		m.put("list1",d.display("country"));
		return "state";
	}
	@RequestMapping(value="Addstate.net",method=RequestMethod.POST)
	public String xyz(@ModelAttribute("m1") state_master sm,@RequestParam("state") String[] s,ModelMap m) throws IOException{
		try{
		sm = d.insert(sm);
		for (int i = 0; i < s.length; i++) {
		state_details sd = new state_details(s[i], sm);
		d.insert(sd);	
		}
		}
		catch(Exception e){
			return "redirect:/error.net";
		}
		m.put("m1",new state_master());
		m.put("list",d.display("state_master"));
		m.put("list1",d.display("country"));
		return "state";
	}
	@RequestMapping(value="Addcity.net",method=RequestMethod.GET)
	public String xyz7(ModelMap m){
		m.put("m2",new city_master());
		m.put("list",d.display("city_master"));
		m.put("list1",d.display("state_master"));
		m.put("list2",d.display("country"));
		return "city";
	}
	@RequestMapping(value="Addcity.net",method=RequestMethod.POST)
	public String xyz1(@ModelAttribute("m2") city_master cm,BindingResult bindingResult, @RequestParam("city") String[] city,ModelMap m) throws IOException{
		try{
			System.out.println("meet");
		cm = d.insert(cm);
		for (int i = 0; i < city.length; i++) {
		city_details cd = new city_details(city[i],cm);
			d.insert(cd);	
		}
		}
		catch(Exception e){
			return "redirect:/error.net";
		}
		m.put("m2",new city_master());
		m.put("list",d.display("city_master"));
		m.put("list1",d.display("state_master"));
		m.put("list2",d.display("country"));
		return "city";
	}
	@RequestMapping(value="adduniversity.net",method=RequestMethod.GET)
	public String xyz8(ModelMap m){
		m.put("m1",new university());
		m.put("list",d.display("university"));
		return "university";
	}
	@RequestMapping(value="adduniversity.net",method=RequestMethod.POST)
	public String xyz(@ModelAttribute("m1") university u,BindingResult bindingResult,ModelMap m) throws IOException{
		try{
			d.insert(u);
		}
		catch(Exception e){
			return "redirect:/error.net";
		}
		m.put("m1",new university());
		m.put("list",d.display("university"));
		return "university";
	}
	@RequestMapping(value="deleteuniversity.net",method=RequestMethod.POST)
	public String xyz11(@RequestParam("id") int id1,ModelMap m){
		try{
		university u = new university(id1);
		d.delete(u);
		}
		catch(Exception e){
			return "redirect:/error.net";
		}
		m.put("m1",new university());
		m.put("list",d.display("university"));
		return "university";
	}
	@RequestMapping(value="updateuniversity.net",method=RequestMethod.POST)
	public String xyz13(@RequestParam("id") int id2,@RequestParam("uu") String uname,ModelMap m){
		university u = new university(id2, uname);
		d.insert(u);
		m.put("m1",new university());
		m.put("list",d.display("university"));
		return "university";
	}
	@RequestMapping(value="removeuniversity.net",method=RequestMethod.POST)
	public String xyz12(@RequestParam("id") int id1,ModelMap m){
		university u =(university) d.display("university","umid = '" + id1+ "'").get(0);
		u.setActive_flag(1);
		d.insert(u);
		m.put("m1",new university());
		m.put("list",d.display("university"));
		return "university";
	}
	@RequestMapping(value="retrieveuniversity.net",method=RequestMethod.POST)
	public String xyz16(@RequestParam("id") int id1,ModelMap m){
		university u =(university) d.display("university","umid = '" + id1+ "'").get(0);
		u.setActive_flag(0);
		d.insert(u);
		m.put("m1",new university());
		m.put("list",d.display("university"));
		return "university";
	}
	@RequestMapping(value="addcollege.net",method=RequestMethod.GET)
	public String xyz10(ModelMap m){
		m.put("m1",new college_master());
		m.put("list",d.display("college_master"));
		m.put("list1",d.display("university"));
		return "college";
	}
	@RequestMapping(value="addcollege.net",method=RequestMethod.POST)
	public String xyz1(@ModelAttribute("m1") college_master cm,BindingResult bindingResult, @RequestParam("clg") String[] clg,ModelMap m) throws IOException{
		try{
			cm = d.insert(cm);
			for (int i = 0; i < clg.length; i++) {
			college_details cd = new college_details(clg[i], cm);
			d.insert(cd);	
		}
		}
		catch(Exception e){
			return "redirect:/error.net";
		}
		m.put("m1",new college_master());
		m.put("list",d.display("college_master"));
		m.put("list1",d.display("university"));
		return "college";
	}
	@RequestMapping(value="addfield.net",method=RequestMethod.GET)
	public String xyz13(ModelMap m){
		m.put("m1",new field());
		m.put("list",d.display("field"));
		return "field";
	}
	@RequestMapping(value="addfield.net",method=RequestMethod.POST)
	public String xyz1(@ModelAttribute("m1") field f,BindingResult bindingResult,ModelMap m){
		/*l.setActive_flag(0);*/
		d.insert(f);
		m.put("list",d.display("field"));
		return "field";
	}
	@RequestMapping(value="deletefield.net",method=RequestMethod.POST)
	public String xyz13(@RequestParam("id") int id1,ModelMap m){
		try{
		field f = new field(id1);
		d.delete(f);
		m.put("m1",new field());
		m.put("list",d.display("field"));
		}
		catch(Exception e){
			/*System.out.println("error");*/
			return "redirect:/error.net";
		}
		return "field";
	}
	@RequestMapping(value="updatefield.net",method=RequestMethod.POST)
	public String xyz(@RequestParam("id") int id2,@RequestParam("field") String field,ModelMap m){
		field f = new field(id2,field);
		d.insert(f);
		m.put("m1",new field());
		m.put("list",d.display("field"));
		return "field";
	}
	@RequestMapping(value="removefield.net",method=RequestMethod.POST)
	public String xyz9(@RequestParam("id") int id1,ModelMap m){
		field f =(field) d.display("field","fieldid = '" + id1+ "'").get(0);
		f.setActive_flag(1);
		d.insert(f);
		m.put("m1",new field());
		m.put("list",d.display("field"));
		return "field";
	}
	@RequestMapping(value="retrievefield.net",method=RequestMethod.POST)
	public String xyz10(@RequestParam("id") int id1,ModelMap m){
		
		field f =(field) d.display("field","fieldid = '" + id1+ "'").get(0);
		f.setActive_flag(0);
		d.insert(f);
		m.put("m1",new field());
		m.put("list",d.display("field"));
		return "field";
	}
	
	@RequestMapping(value="mailsend.net",method=RequestMethod.GET)
	public String xyz9(ModelMap m){
		email.send("meetvaland107235@gmail.com","emnem","xyz");
		return "welcome";
	}
	@RequestMapping(value="getsublang.net",method=RequestMethod.POST)
	public String xyz7(ModelMap m,@RequestParam("id") int id){
		m.put("list",d.display("sublanguage_master","l.lid='"+id+"'"));
		m.put("m",1);
		return "getdata";
	}
	@RequestMapping(value="getstate.net",method=RequestMethod.POST)
	public String xyz(ModelMap m,@RequestParam("id") int id){
		m.put("list",d.display("state_master","c.countryid='"+id+"'"));
		m.put("m",2);
		return "getdata";
	}
	@RequestMapping(value="getcity.net",method=RequestMethod.POST)
	public String xyz1(ModelMap m,@RequestParam("id") int id){
		m.put("list",d.display("city_master","sd.statedid='"+id+"'"));
		m.put("m",3);
		return "getdata";
	}
	@RequestMapping(value="getclg.net",method=RequestMethod.POST)
	public String xyz3(ModelMap m,@RequestParam("id") int id){
		m.put("list",d.display("college_master","u.umid='"+id+"'"));
		m.put("m",4);
		return "getdata";
	}
	@RequestMapping(value="getmaterial.net",method=RequestMethod.POST)
	public String getmaterial(ModelMap m,@RequestParam("id") int id){
		m.put("list",d.display("material_master","sd.sdid='"+id+"'"));
		m.put("m",5);
		return "getdata";
	}
}
