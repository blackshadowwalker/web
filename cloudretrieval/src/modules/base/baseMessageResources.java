package modules.base;

import java.util.Locale;

import org.apache.struts.util.MessageResources;
import org.apache.struts.util.MessageResourcesFactory;

public class baseMessageResources extends MessageResources
{

	public baseMessageResources(MessageResourcesFactory factory, String config)
	{
		super(factory, config);
		System.out.println("baseMessageResources");
	}


	@Override
	public String getMessage(String key)
	{
		System.out.println("getMessage: key="+key);
		return super.getMessage(key);
	}


	@Override
	public String getMessage(Locale locale, String key)
	{
		System.out.println("getMessage: locale="+locale+" key="+key);
		return null;
	}

}
