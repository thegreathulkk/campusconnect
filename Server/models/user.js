const  mongoose = require("mongoose");
const authRouter = require("../routes/auth");



const userSchema =  mongoose.Schema({
        name: {
            required : true,
            type: String,
            trim: true,
        },
        email: {
            required : true,
            type: String,
            trim: true,
            validate: {
                validator: (value) => {
                    const re =/^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
                    return value.match(re);
                },
                message: 'Akash Please enter a valid enter email address',
            },
        },
        password: {
            required: true,
            type: String,

        },
        address: {
            type:String,
            default: '',
        },
        type: {
            type: String,
            default: "user",
        }
        //cart
    }
)

const User = mongoose.model("User", userSchema);
module.exports = User;