using System;
using System.Collections.Generic;
using System.Security.Policy;
using System.Web;
using System.Web.UI;


/// <summary>
/// Summary description for Alert
/// </summary>
public  class Blockchain
{
    public IList<Block> Chain { set; get; }

    public Blockchain()
    {
        InitializeChain();
       
    }


    public void InitializeChain()
    {
        Chain = new List<Block>();
    }

    public Block CreateGenesisBlock()
    {
        return new Block(DateTime.Now, null, B_Count.pid); //Pass p_id from code while registration
    }

    public void AddGenesisBlock()
    {
        Chain.Add(CreateGenesisBlock());

        
    }

    public Block GetLatestBlock()
    {
        
        return Chain[Chain.Count - 1];
        //return Chain[B_Count.id];

    }

    public string AddBlock(Block block)
    {
        
        block.Index = B_Count.id;
        block.PreviousHash =B_Count.prev_hash;
        block.Hash = block.CalculateHash();
        Chain.Add(block);
        return(block.Hash);
    } 
}