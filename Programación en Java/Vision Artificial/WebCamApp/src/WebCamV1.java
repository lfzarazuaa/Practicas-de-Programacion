import com.github.sarxos.webcam.Webcam;
 
public class WebCamV1 { 

    public static void main(String[] args)
    { 
        JWebCam Cam1=new JWebCam();
        Cam1.DetectDefaultWebCam();
        Cam1.Init();
    } 
} 
