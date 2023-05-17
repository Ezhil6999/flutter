const mongoose=require('mongoose');
const validator=require('validator');
const userSchema=new mongoose.Schema({
    name:{
        type:String,
        required:true,
        trim:true,
    },
    email:{
        type:String,
        require:true,
        trim:true,
        validate:{
            validator: validator.isEmail,
            message: 'It is not a valid email',
            isAsync: false
          }
    },
    password:{ 
        required:true,
        type:String,
        minlength:6
      
    },
    address:{
        type:String,
        default:'', 
    },
    type:{
        type:String,
        default:"user",
    }
});
const User=mongoose.model("user",userSchema);
module.exports=User;