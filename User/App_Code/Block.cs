using System;
using System.Collections.Generic;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;


/// <summary>
/// Summary description for Alert
/// </summary>
public  class Block
{
    public int Index { get; set; }  
    public DateTime TimeStamp { get; set; }  
    public string PreviousHash { get; set; }  
    public string Hash { get; set; }  
    public string Data { get; set; }  
  
    public Block(DateTime timeStamp, string previousHash, string data)  
    {  
        Index = 0;  
        TimeStamp = timeStamp;  
        PreviousHash = previousHash;  
        Data = data;  
        Hash = CalculateHash();  
    }  
  
    public string CalculateHash()  
    {  
        SHA256 sha256 = SHA256.Create();
        String data_all = Convert.ToString(TimeStamp) + PreviousHash + Data;
        byte[] inputBytes =  Encoding.ASCII.GetBytes(data_all); 
        byte[] outputBytes = sha256.ComputeHash(inputBytes);  
  
        return Convert.ToBase64String(outputBytes);  
    }  
}