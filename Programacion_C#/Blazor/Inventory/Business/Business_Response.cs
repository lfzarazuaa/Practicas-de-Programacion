using System;
using System.Collections.Generic;
using System.Text;

namespace Business
{
    public class Business_Response
    {
        public List<string> ErrorMessages { get; set; }
        public bool Error { get; set; }

        public Business_Response()
        {
            this.Error = false;
            this.ErrorMessages = new List<string>();
        }

        public Business_Response(bool Error, List<string> ErrorMessages)
        {
            this.Error = Error;
            this.ErrorMessages = ErrorMessages;
        }
    }
}
