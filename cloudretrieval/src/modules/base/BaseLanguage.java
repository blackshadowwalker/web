package modules.base;

import java.util.Locale;

public class BaseLanguage
{
	private Locale locale=Locale.CHINA;
	private String language="zh_CN";
	public static final String BundleBaseName = "languages.language";
	public static final String BASENAME = "languages.language";
	public static final String DEFAULT_LANGUAGE="zh_CN";
	
	public static void main(String args[]){
		BaseLanguage bl = new BaseLanguage();
		Locale locale = bl.getLocale("zh_CN");
		System.out.println(locale.getDisplayLanguage()+"***"+locale.getCountry());
		
		String countries[] = Locale.getISOCountries();
		String languages[] = Locale.getISOLanguages();
		Locale locales[] = Locale.getAvailableLocales();
		for(int i=0; i<locales.length; i++){
			System.out.println(locales[i].US.getLanguage()+"_"+locales[i].getCountry());
		}
		System.out.println("*******************");
		for(int i=0; i<countries.length; i++){
			System.out.println(languages[i]+"_"+countries[i]);
		}
		/**/
	}
	// language="zh_CN"
	public static Locale getLocale(String language){
		String spt []= language.split("_");
		if(language==null ||  language.equals(""))
			return Locale.getDefault();
		System.out.println(language);
		if(spt.length==2)
			return new Locale(spt[0], spt[1]);
		else
			return new Locale(language);
	}
	
	public Locale getLocale()
	{
		return locale;
	}
	public void setLocale(Locale locale)
	{
		this.locale = locale;
	}
	public String getLanguage()
	{
		return language;
	}
	public void setLanguage(String language)
	{
		this.language = language;
	}
	
}
