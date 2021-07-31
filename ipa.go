package main

import (
	"encoding/base64"
	"fmt"
)

func main() {
	str := "Hi Dad"
	fmt.Printf("String: '%s'\n", str)

	// Encode
	encoded := base64Encode([]byte(str))
	fmt.Println("Encoded: ", encoded)

	// Decode
	decoded, ok := base64Decode(encoded)
	fmt.Printf("Decoded: '%s'   ok:%t\n", string(decoded), ok)
}

func base64Encode(bytes []byte) string {
	return base64.StdEncoding.EncodeToString(bytes)
}

func base64Decode(str string) ([]byte, bool) {
	bytes, err := base64.StdEncoding.DecodeString(str)
	if err != nil {
		return []byte{}, false
	}
	return bytes, true
}



/*
package main

import (
    "log"
    "os"
    "os/exec"
)

func execCmd(command string, argsv []string) (err error){
    args := argsv
    cmdObj := exec.Command(command, args...)
    cmdObj.Stdout = os.Stdout
    cmdObj.Stderr = os.Stderr
    err = cmdObj.Run()
    if err != nil {
        log.Fatal(err)
        return err
    }
    return nil
}

func main() {
    /*
    This demonstrates on executing linux commands.
    To change mac address ip command is used instead of ifconfig.
    step1: shutdown interface by sudo ip link set dev ens33 down
    step2: change hardware address which is mac address, sudo ip link set dev ens33 address 00:11:22:33:44:55
    step3: turn on interface, sudo ip link set dev ens33 up
    Check the new interface address ip link show ens33
    Check all interfaces use ip link show.

    sudo := "sudo"
    device := "en2"
    macAddress := "00:11:22:33:44:55"
    var options = map[string]string{
        "down": "down",
        "up": "up",
        "address": "address",
        "newMac": macAddress,
    }

    execCmd(sudo, []string{"ifconfig", device, options["down"]})
    execCmd(sudo, []string{"ifconfig", device, options["address"], options["newMac"]})
    execCmd(sudo, []string{"ifconfig", device, options["up"]})
    execCmd("ip", []string{"link", "show", device})
}
*/
