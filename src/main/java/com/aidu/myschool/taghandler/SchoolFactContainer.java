package com.aidu.myschool.taghandler;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;
import javax.servlet.jsp.tagext.IterationTag;

public class SchoolFactContainer extends BodyTagSupport {
	
	public int doStartTag() throws JspException {
		try {
			//pageContext.getOut().print("doStartTag()");
			JspWriter out = pageContext.getOut();
			out.print("<div class=\"fact-container\">");
            out.print("<div class=\"fact\">");
            out.print("<div class=\"left-note\">");
            		out.print("<svg class=\"paperclip\" enable-background=\"new 0 0 100 100\" version=\"1.1\" viewBox=\"0 0 100 100\" x=\"0px\" xml:space=\"preserve\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns=\"http://www.w3.org/2000/svg\" y=\"0px\">");
            				out.print("<path class=\"behind\" d=\"M54,18.3c1.8,1.6,3,4,3,6.7\" fill=\"none\" stroke-miterlimit=\"10\" stroke-width=\"3\" stroke=\"#CC3333\"></path>");
            						out.print("<path class=\"in-front\" d=\"M57,38v41.1c0,4.9-4,8.9-8.9,8.9h-0.1");
            								out.print("C43,88,39,84,39,79.1V24.9c0-4.9,4-8.9,8.9-8.9h0.1c2.3,0,4.4,0.9,6,2.3\" fill=\"none\" stroke-miterlimit=\"10\" stroke-width=\"3\" stroke=\"#CC3333\"></path>");
            								out.print("</svg>");
            										out.print("<span>学校图表</span>");
            												out.print("</div>");
			return EVAL_BODY_BUFFERED;
		} catch(IOException ioe) {
			throw new JspException(ioe.getMessage());
		}
	}

	/*public void doInitBody() throws JspException {
		try {  
			// Note, that this is a different writer than the one
			// you have in doStartTag and doEndTag.
			bodyContent.print("doInitBody()");
		} catch(IOException ioe) {
			throw new JspException(ioe.getMessage());
		}
	}*/

	/*public int doAfterBody() throws JspException {
		try {
			// Note, that this is a different writer than the one
			// you have in doStartTag and doEndTag.
			bodyContent.print("doAfterBody()");
			//return IterationTag.EVAL_BODY_AGAIN;  
			// Use this to loop
			return SKIP_BODY;
		} catch(IOException ioe) {
			throw new JspException(ioe.getMessage());
		}
	}*/

	public int doEndTag() throws JspException {
		try {  
			// Write from bodyContent writer to original writer.
			pageContext.getOut().print(bodyContent.getString());
			// Now we're back to the original writer.
			//pageContext.getOut().print("doEndTag()");
			pageContext.getOut().print("</div></div>");
			return EVAL_PAGE;
		} catch(IOException ioe) {
			throw new JspException(ioe.getMessage());
		} 
	}
}
