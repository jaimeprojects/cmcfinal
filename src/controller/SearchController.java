package controller;

import java.util.ArrayList;

import dblibrary.project.csci230.UniversityDBLibrary;

/**
 * This class is the Database controller that allows a user to access the database and change things.
 *
 * First version- Ramon Angeles
 * 
 * @author J. Ramon Angeles, James Heidelberger, Jaime Vega, Jonathan First, Vue Xiong
 * @version February 2018
 */

public class SearchController{
  
  UniversityDBLibrary dblib = new UniversityDBLibrary("stacko", "csci230");
//  String universityName;
//  private String state;
//  private String locationType;//Urban, Rural,etc
//  private String control;//whether school is private or public
//  private int numberOfStudents;
//  private double female;//percentage of female students in the university
//  private double satVerbal;
//  private double satMath;
//  private double expenses;
//  private double financialAid;
//  private int numOfApplicants;
//  private double numAdmitted;
//  private double enrolled;
//  private int academicScale;
//  private int socialScale;
//  private int qualityOfLife;
  

  
  /**
   * Allows the user to search for a university, passing in all the search citeria.
   * 
   * @param universityName the name of the university 
   * @param state the state the university is located in 
   * @param location whether is rural, urban or city
   * @param control whether the school is public or private
   * @param numberOfStudents the number of students at the school
   * @param female the percentage of female students at the school
   * @param SATVerbal the SAT verbal score at the school
   * @param SATMath the SAT math score at the school
   * @param expenses the cost to attend the school
   * @param financialAid the financial aid the school offers for students
   * @param numberOfApplicants the number of students who applied to the school
   * @param admitted the number of students admitted to the school
   * @param enrolled the number of students enrolled at the school
   * @param academicScale the school's academic rating
   * @param socialScale the school's social rating
   * @param qualityOfLifeScale the school's quality of life for students
 * @returns an ArrayList of universities that fits the search criteria
   */
  public ArrayList<String> search(String universityName, String state, String location, String control, String numberOfStudents, String female, String satVerbal,
                                  String satMath, String expenses, String financialAid, String numberOfApplicants, String admitted, String enrolled,
                                  String academicScale, String socialScale, String qualityOfLifeScale){
    ArrayList<String> schoolInfo = new ArrayList<String>();
    
    String[][] school = dblib.university_getUniversities();
    String[][] results = new String[school.length][2];
    Integer count = 0;
    Integer p = 0; //counts parameters passed
    if(universityName != null && !universityName.equals("Enter University Name Here"))
    {
      p++;
    }
    if(state != null && !state.equals(""))
    {
      p++;
    }
    if(location != null && !location.equals("Select Location Type"))
    {
      p++;
    }
    
    if(control != null && !control.equals("Select Control Type"))
    {
      p++;
    }
    if(numberOfStudents != null && !numberOfStudents.equals("Select Number Of Students"))
    {
      p++;
    }
    if(female != null && !female.equals("Select Percentage Female"))
    {
      p++;
    }
    if(satVerbal != null && !satVerbal.equals("Select SAT Verbal Score"))
    {
      p++;
    }
    if(satMath != null && !satMath.equals("Select SAT Math Score"))
    {
      p++;
    }
    if(expenses != null && !expenses.equals("Select Expenses"))
    {
      p++;
    }
    
    if(financialAid != null && !financialAid.equals("Select Percentage Finanical Aid"))
    {
      p++;
    }
    if(numberOfApplicants != null && !numberOfApplicants.equals("Select Number of Applicants"))
    {
      p++;
    }
    if(admitted != null && !admitted.equals("Select Percentage Accepted"))
    {
      p++;
    }
    
    if(enrolled != null && !enrolled.equals("Select Percentage Enrolled"))
    {
      p++;
    }
    if(academicScale != null && !academicScale.equals("Select Academic Scale"))
    {
      p++;
    }
    if(socialScale != null && !socialScale.equals("Select Social Scale"))
    {
      p++;
    }
    
    if(qualityOfLifeScale != null && !qualityOfLifeScale.equals("Select Quality of Life Scale")) 
    {
      p++;
    }
    
    //String[][] empArr = dblib.university_getNamesWithEmphases();
    for(int i =0 ; i < school.length; i++)
    {
      count = 0;
      //for(int j = 0; j < 16; j++)
      //{
        if(!universityName.equals("Enter University Name Here") && school[i][0].contains(universityName) && !universityName.equals(null))
        {
          count++;
        }
        if(!state.equals("Enter State Here") && school[i][1].equals(state) && !state.equals(null))
        {
          count++;
        }
        if(!location.equals("Select Location Type") && school[i][2].equals(location) &&  !location.equals(null))
        {
          count++;
        }
        if(!control.equals("Select Control Type") && school[i][3].equals(control) && !control.equals(null))
        {
          count++;
        }
        if(!numberOfStudents.equals("Select Number Of Students") && numberOfStudents.contains("ABOVE") && !numberOfStudents.equals(null))
        {
        	if(Integer.parseInt(school[i][4])>(40000))
        	{
        		count++;
        	}
        }
        else if(!numberOfStudents.equals("Select Number Of Students") && Double.parseDouble(school[i][4])<=(Double.parseDouble(numberOfStudents)) && !numberOfStudents.equals(null))
        {
          count++;
        }
        if(!female.equals("Select Percentage Female") && Double.parseDouble(school[i][5])<=Double.parseDouble((female)) && !female.equals(null))
        {
          count++;
        }
        if(!satVerbal.equals("Select SAT Verbal Score") && Double.parseDouble(school[i][6])<=Double.parseDouble((satVerbal)) && !satVerbal.equals(null))
        {
          count++;
        }
        if(!satMath.equals("Select SAT Math Score") && Double.parseDouble(school[i][7])<=Double.parseDouble((satMath)) && !satMath.equals(null))
        {
          count++;
        }
        if(!expenses.equals("Select Expenses") && Double.parseDouble(school[i][8])<=Double.parseDouble((expenses)) && !expenses.equals(null))
        {
          count++;
        }
        if(!financialAid.equals("Select Percentage Finanical Aid") && Double.parseDouble(school[i][9])<=Double.parseDouble((financialAid)) && !financialAid.equals(null))
        {
          count++;
        }
        if(!numberOfApplicants.equals("Select Number of Applicants") && numberOfApplicants.contains("ABOVE") && !numberOfApplicants.equals(null))
        {
        	if(Integer.parseInt(school[i][10])>40000)
        	{
        		count++;
        	}
        }
        else if(!numberOfApplicants.equals("Select Number of Applicants") && Integer.parseInt(school[i][10])<=(Integer.parseInt(numberOfApplicants)) && !numberOfApplicants.equals(null))
        {
          count++;
        }
        if(!admitted.equals("Select Percentage Accepted") && Double.parseDouble(school[i][11])<=Double.parseDouble((admitted)) && !admitted.equals(null))
        {
          count++;
        }
        if(!enrolled.equals("Select Percentage Enrolled") && Double.parseDouble(school[i][12])<=Double.parseDouble((enrolled)) && !enrolled.equals(null))
        {
          count++;
        }
        if(!academicScale.equals("Select Academic Scale") && Integer.parseInt(school[i][13])<=Integer.parseInt((academicScale)) && !academicScale.equals(null))
        {
          count++;
        }
        if(!socialScale.equals("Select Social Scale") && Integer.parseInt(school[i][14])<=Integer.parseInt((socialScale)) && !socialScale.equals(null))
        {
          count++;
        }
        if(!qualityOfLifeScale.equals("Select Quality of Life Scale") && Integer.parseInt(school[i][15])<=Integer.parseInt((qualityOfLifeScale)) && !qualityOfLifeScale.equals(null)) 
        { 
          count++;
        }
               
      
      
      results[i][0] = school[i][0];
      results[i][1] = Integer.toString(count);
      //System.out.println(results[i][0] + " " + results[i][1]);
    }
    //for(Integer matchResults = 18; matchResults > 0; matchResults--)
    //{
      
      for (int x = 0; x < results.length; x++)
      {
        //System.out.println(results[x][0]);
        if (results[x][1].equals(Integer.toString(p)))
        {
//          System.out.println(results[x][0]);
//          printr[somethingCounter][0] = results[x][0];
//          printr[somethingCounter][1] = results[x][1];
//          somethingCounter++;
          schoolInfo.add(results[x][0]);
          
          
        } 
      }
    //}
    return schoolInfo;
  }
}