const User=require('../model/user');
const express=require('express');
const bcryptjs=require('bcryptjs');
const jwt=require('jsonwebtoken');
const authrouter=express.Router();

authrouter.post('/api/signup',async function(req,res){
   try {
    const {name,email,password}=req.body;
    const existingone=await User.findOne({email});
    if(existingone){
         return res.status(400).json({msg:'User with same email already Exists..'});
    }
    const hashedPassword=(await bcryptjs.hash(password,8));
    let user=new User({
        email,password:hashedPassword,name,
    });
    user=await user.save();
    res.json(user);
   } catch (e) {
    res.status(500).json({error:e.message})
   }
});

authrouter.post('/api/signin',async (req,res)=>{
    try {
        const {email,password}=req.body;
        const user=await User.findOne({email});
        if(!user){
            return res.status(400).json({msg:'email not Exists..'}); 
        }
        const Match=await bcryptjs.compare(password,user.password);
        if(!Match){
            return res.status(400).json({msg:'Password Mismatch'});
        }
        const token=jwt.sign({id:user._id},"k");
        res.json({token, ...user._doc});
    } catch (e) {
        res.status(500).json({error: e.message});
    }
})
module.exports=authrouter;