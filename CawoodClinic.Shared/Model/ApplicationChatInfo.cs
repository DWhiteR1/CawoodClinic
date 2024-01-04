using CawoodClinic.Shared.Devices;
using CawoodClinic.Shared.User;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CawoodClinic.Shared.Model
{
    public class ApplicationChatInfo : ApplicationChatUser
    {
        public ApplicationChatInfo(string userId, string userName, string role) : base(userId, userName, role)
        {
            Devices = new List<ApplicationChatDevice>();
        }   
        public bool IsOnline { get; set; } = false;
        public List<ApplicationChatDevice> Devices { get; set; }

    }
}
