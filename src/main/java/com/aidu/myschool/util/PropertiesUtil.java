package com.aidu.myschool.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Properties;

public class PropertiesUtil {
	
	public Properties getProperties(String filename) throws IOException {
		Properties prop = new Properties();
		
		InputStream inputStream = getClass().getClassLoader().getResourceAsStream(filename);
		 
		if (inputStream != null) {
			prop.load(inputStream);
		} else {
			throw new FileNotFoundException("property file '" + filename + "' not found in the classpath");
		}
		
		return prop;
	}
}
