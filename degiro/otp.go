package degiro

import (
	"fmt"
	"time"

	"github.com/pquerna/otp/totp"
)

func (c *Client) getOTPCode(totpSecret string) (string, error) {
	if totpSecret == "" {
		return "", ErrOtpRequired
	}

	otpCode, err := totp.GenerateCode(c.totpSecret, time.Now())
	if err != nil {
		return "", fmt.Errorf("generating opt code: %v", err)
	}

	return otpCode, nil
}
