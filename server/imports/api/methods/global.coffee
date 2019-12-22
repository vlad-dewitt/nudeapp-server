import React from 'react'
import ReactDOM from 'react-dom/server'



export default
  getInitConfig: (data) =>
    future = new Future()

    App = APP.findOne()

    config =
      welcomeMessage: "Welcome!"
      language: App.config.languages[0]
      ios_url: App.config.ios_url
      android_url: App.config.android_url
      video_available: App.config.video_available

    future.return
      code: 'S'
      message: ''
      data: config

    future.wait()



  setConfig: (what, value) =>
    switch what
      when 'ios_url'
        APP.update({ id: 'APP' }, { $set: { 'config.ios_url': value } })
      when 'android_url'
        APP.update({ id: 'APP' }, { $set: { 'config.android_url': value } })
      when 'video_available'
        APP.update({ id: 'APP' }, { $set: { 'config.video_available': value } })



  sendConfirmationEmail: (address, token) ->
    template = =>
      <div>
        <meta name="viewport" content="width=device-width" />
        <meta httpEquiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Simple Transactional Email</title>
        <style type="text/css" dangerouslySetInnerHTML={{__html: "\n              @media only screen and (max-width: 620px) {\n                table[class=body] h1 {\n                  margin-bottom: 10px !important; }\n                table[class=body] .wrapper,\n                table[class=body] .article {\n                  padding: 20px !important; }\n                table[class=body] .content {\n                  padding: 0 !important; }\n                table[class=body] .container {\n                  padding: 0 !important;\n                  width: 90% !important;\n                  margin: 0 auto; }\n                table[class=body] .main {\n                  border-left-width: 0 !important;\n                  border-radius: 0 !important;\n                  border-right-width: 0 !important; }\n                table[class=body] .btn table {\n                  width: 100% !important; }\n                table[class=body] .btn a {\n                  width: 100% !important; }\n                table[class=body] .img-responsive {\n                  height: auto !important;\n                  max-width: 100% !important;\n                  width: auto !important; }}\n              /* -------------------------------------\n                  PRESERVE THESE STYLES IN THE HEAD\n              ------------------------------------- */\n              .im {color: #7B7B7B !important;}\n              @media all {\n                .ExternalClass {\n                  width: 100%; }\n                .ExternalClass,\n                .ExternalClass p,\n                .ExternalClass span,\n                .ExternalClass font,\n                .ExternalClass td,\n                .ExternalClass div {\n                  line-height: 100%; }\n                .apple-link a {\n                  color: inherit !important;\n                  font-family: inherit !important;\n                  font-size: inherit !important;\n                  font-weight: inherit !important;\n                  line-height: inherit !important;\n                  text-decoration: none !important; }\n                }\n              " }} />
        <table border={0} cellPadding={0} cellSpacing={0} className="body" style={{borderCollapse: 'separate', msoTableLspace: '0pt', msoTableRspace: '0pt', backgroundColor: '#f6f6f6', width: '100%', paddingBottom: '30px'}}>
          <tbody>
            <tr>
              <td style={{fontFamily: '"San Francisco", sans-serif', fontSize: '14px', verticalAlign: 'top'}}>&nbsp;</td>
              <td className="container" style={{fontFamily: '"San Francisco", sans-serif', fontSize: '14px', verticalAlign: 'top', display: 'block', maxWidth: '580px', padding: '10px', width: '580px', margin: '0 auto !important'}}>
                <div className="content" style={{boxSizing: 'border-box', display: 'block', margin: '0 auto', maxWidth: '580px', padding: '10px'}}>
                  <span className="preheader" style={{color: 'transparent', display: 'none', height: 0, maxHeight: 0, maxWidth: 0, opacity: 0, overflow: 'hidden', msoHide: 'all', visibility: 'hidden', width: 0}}>This is preheader text. Some clients will show this text as a preview.</span>
                  <div style={{margin: 0, marginTop: '20px', lineHeight: 0}}>
                    <img src="#{ Meteor.absoluteUrl() }img/pictures/email-banner.png" style={{width: '100%'}} />
                  </div>
                  <table className="main" style={{borderCollapse: 'separate', msoTableLspace: '0pt', msoTableRspace: '0pt', background: '#fff', borderRadius: '3px', width: '100%', marginTop: '-30px', color: '#7B7B7B'}}>
                    <tbody><tr>
                        <td className="wrapper" style={{fontFamily: '"San Francisco", sans-serif', fontSize: '14px', verticalAlign: 'top', borderRadius: '8px', boxSizing: 'border-box', padding: '20px', boxShadow: '0px 5px 15px 3px #DDD'}}>
                          <table border={0} cellPadding={0} cellSpacing={0} style={{borderCollapse: 'separate', msoTableLspace: '0pt', msoTableRspace: '0pt', width: '100%', padding: '30px 10px'}}>
                            <tbody><tr>
                                <td style={{fontFamily: '"San Francisco", sans-serif', verticalAlign: 'top'}}>
                                  <p style={{fontFamily: '"San Francisco", sans-serif', color: '#7B7B7B', fontSize: '32px', fontWeight: 500, margin: 0, marginBottom: '15px'}}>Hello,</p>
                                  <p style={{fontFamily: '"San Francisco", sans-serif', color: '#7B7B7B', fontSize: '14px', fontWeight: 'normal', margin: 0, marginBottom: '15px'}}>We received a request to reset your PIN. Please use the code below to reset the PIN.</p>
                                  <table border={0} cellPadding={0} cellSpacing={0} className="btn btn-primary" style={{borderCollapse: 'separate', msoTableLspace: '0pt', msoTableRspace: '0pt', boxSizing: 'border-box', width: '100%'}}>
                                    <tbody>
                                      <tr>
                                        <td align="left" style={{fontFamily: '"San Francisco", sans-serif', fontSize: '12px', verticalAlign: 'top', paddingBottom: '15px'}}>
                                          <table border={0} cellPadding={0} cellSpacing={0} style={{borderCollapse: 'separate', msoTableLspace: '0pt', msoTableRspace: '0pt', width: '100%'}}>
                                            <tbody>
                                              <tr>
                                                <td style={{fontFamily: '"San Francisco", sans-serif', fontSize: '14px', verticalAlign: 'top', backgroundColor: '#ffffff', borderRadius: '50px', textAlign: 'center', padding: '40px 0'}}>
                                                  <a href="#" target="_blank" style={{textDecoration: 'none', backgroundColor: '#ffffff', border: 'solid 2px pink', borderRadius: '50px', boxSizing: 'border-box', color: '#979797', cursor: 'pointer', display: 'inline-block', fontSize: '20px', fontWeight: 'bold', margin: 0, padding: '12px 25px', textTransform: 'capitalize'}}>{"Access Code: #{ token }"}</a></td>
                                              </tr>
                                            </tbody>
                                          </table>
                                        </td>
                                      </tr>
                                    </tbody>
                                  </table>
                                  <hr style={{borderTop: '1px solid #9A9A9A', borderBottom: 0}} />
                                  <p style={{fontFamily: '"San Francisco", sans-serif', fontSize: '14px', fontWeight: 'normal', margin: 0, marginBottom: '15px', color: '#7B7B7B'}}>Didn't request an access code? Simply ignore this email.</p>
                                </td>
                              </tr>
                            </tbody></table>
                        </td>
                      </tr>
                    </tbody></table>
                  <div className="footer" style={{clear: 'both', paddingTop: '40px', textAlign: 'center', width: '100%'}}>
                    <table border={0} cellPadding={0} cellSpacing={0} style={{borderCollapse: 'separate', msoTableLspace: '0pt', msoTableRspace: '0pt', width: '100%'}}>
                      <tbody><tr>
                          <td className="content-block" style={{fontFamily: '"San Francisco", sans-serif', fontSize: '12px', verticalAlign: 'top', color: '#9A9A9A', textAlign: 'center'}}>
                          </td>
                        </tr>
                        <tr>
                          <td className="content-block powered-by" style={{fontFamily: '"San Francisco", sans-serif', verticalAlign: 'top', color: '#9A9A9A', fontSize: '12px', textAlign: 'center'}}>{"@ #{new Date().getFullYear()} Nude.  All rights reserved"}<br />
                            <a href="https://thenudeapp.com/privacy-policy" style={{color: '#7B7B7B', fontSize: '12px'}}>Privacy Policy</a> | <a href="https://thenudeapp.com/terms-of-service" style={{color: '#7B7B7B', fontSize: '12px'}}>Terms &amp; Conditions</a>
                          </td>
                        </tr>
                      </tbody></table>
                  </div>
                </div>
              </td>
              <td style={{fontFamily: '"San Francisco", sans-serif', fontSize: '14px', verticalAlign: 'top'}}>&nbsp;</td>
            </tr>
          </tbody>
        </table>
      </div>



    Email.send
      from: 'NudeApp <hello@nudeapp.co>'
      to: address
      subject: 'Your Nude Access Code'
      html: ReactDOM.renderToString template()



  sendSupportMessage: (data) ->
    if data.name.length > 0 and data.email.length > 0 and data.message.length > 0
      template = =>
        <div>
          <meta name="viewport" content="width=device-width" />
          <meta httpEquiv="Content-Type" content="text/html; charset=UTF-8" />
          <title>Simple Transactional Email</title>
          <style type="text/css" dangerouslySetInnerHTML={{__html: "\n              @media only screen and (max-width: 620px) {\n                table[class=body] h1 {\n                  margin-bottom: 10px !important; }\n                table[class=body] .wrapper,\n                table[class=body] .article {\n                  padding: 20px !important; }\n                table[class=body] .content {\n                  padding: 0 !important; }\n                table[class=body] .container {\n                  padding: 0 !important;\n                  width: 90% !important;\n                  margin: 0 auto; }\n                table[class=body] .main {\n                  border-left-width: 0 !important;\n                  border-radius: 0 !important;\n                  border-right-width: 0 !important; }\n                table[class=body] .btn table {\n                  width: 100% !important; }\n                table[class=body] .btn a {\n                  width: 100% !important; }\n                table[class=body] .img-responsive {\n                  height: auto !important;\n                  max-width: 100% !important;\n                  width: auto !important; }}\n              /* -------------------------------------\n                  PRESERVE THESE STYLES IN THE HEAD\n              ------------------------------------- */\n              .im {color: #7B7B7B !important;}\n              @media all {\n                .ExternalClass {\n                  width: 100%; }\n                .ExternalClass,\n                .ExternalClass p,\n                .ExternalClass span,\n                .ExternalClass font,\n                .ExternalClass td,\n                .ExternalClass div {\n                  line-height: 100%; }\n                .apple-link a {\n                  color: inherit !important;\n                  font-family: inherit !important;\n                  font-size: inherit !important;\n                  font-weight: inherit !important;\n                  line-height: inherit !important;\n                  text-decoration: none !important; }\n                }\n              " }} />
          <table border={0} cellPadding={0} cellSpacing={0} className="body" style={{borderCollapse: 'separate', msoTableLspace: '0pt', msoTableRspace: '0pt', backgroundColor: '#f6f6f6', width: '100%', paddingBottom: '30px'}}>
            <tbody>
              <tr>
                <td style={{fontFamily: '"San Francisco", sans-serif', fontSize: '14px', verticalAlign: 'top'}}>&nbsp;</td>
                <td className="container" style={{fontFamily: '"San Francisco", sans-serif', fontSize: '14px', verticalAlign: 'top', display: 'block', maxWidth: '580px', padding: '10px', width: '580px', margin: '0 auto !important'}}>
                  <div className="content" style={{boxSizing: 'border-box', display: 'block', margin: '0 auto', maxWidth: '580px', padding: '10px'}}>
                    <span className="preheader" style={{color: 'transparent', display: 'none', height: 0, maxHeight: 0, maxWidth: 0, opacity: 0, overflow: 'hidden', msoHide: 'all', visibility: 'hidden', width: 0}}>This is preheader text. Some clients will show this text as a preview.</span>
                    <div style={{margin: 0, marginTop: '20px', lineHeight: 0}}>
                      <img src="#{ Meteor.absoluteUrl() }img/pictures/email-banner.png" style={{width: '100%'}} />
                    </div>
                    <table className="main" style={{borderCollapse: 'separate', msoTableLspace: '0pt', msoTableRspace: '0pt', background: '#fff', borderRadius: '3px', width: '100%', marginTop: '-30px', color: '#7B7B7B'}}>
                      <tbody><tr>
                          <td className="wrapper" style={{fontFamily: '"San Francisco", sans-serif', fontSize: '14px', verticalAlign: 'top', borderRadius: '8px'; boxSizing: 'border-box', padding: '20px', boxShadow: '0px 5px 15px 3px #DDD'}}>
                            <table border={0} cellPadding={0} cellSpacing={0} style={{borderCollapse: 'separate', msoTableLspace: '0pt', msoTableRspace: '0pt', width: '100%', padding: '40px 10px'}}>
                              <tbody><tr>
                                  <td style={{fontFamily: '"San Francisco", sans-serif', verticalAlign: 'top'}}>
                                    <p style={{fontFamily: '"San Francisco", sans-serif', color: '#7B7B7B', fontSize: '32px', fontWeight: 500, margin: 0, marginBottom: '15px'}}>{ data.name }</p>
                                    <p style={{fontFamily: '"San Francisco", sans-serif', color: '#7B7B7B', fontSize: '14px', fontWeight: 'normal', margin: 0, marginBottom: '30px'}}><a href="mailto:#{ data.email }" style={{ color: '#7B7B7B !important', textDecoration: 'underline' }}>{ data.email }</a></p>
                                    <p style={{fontFamily: '"San Francisco", sans-serif', color: '#7B7B7B', fontSize: '14px', fontWeight: 'normal', margin: 0}}>{ data.message }</p>
                                  </td>
                                </tr>
                              </tbody>
                            </table>
                          </td>
                        </tr>
                      </tbody></table>
                    <div className="footer" style={{clear: 'both', paddingTop: '40px', textAlign: 'center', width: '100%'}}>
                      <table border={0} cellPadding={0} cellSpacing={0} style={{borderCollapse: 'separate', msoTableLspace: '0pt', msoTableRspace: '0pt', width: '100%'}}>
                        <tbody><tr>
                            <td className="content-block" style={{fontFamily: '"San Francisco", sans-serif', fontSize: '12px', verticalAlign: 'top', color: '#9A9A9A', textAlign: 'center'}}>
                            </td>
                          </tr>
                          <tr>
                            <td className="content-block powered-by" style={{fontFamily: '"San Francisco", sans-serif', verticalAlign: 'top', color: '#9A9A9A', fontSize: '12px', textAlign: 'center'}}>{"@ #{new Date().getFullYear()} Nude.  All rights reserved"}<br />
                              <a href="https://thenudeapp.com/privacy-policy" style={{color: '#7B7B7B', fontSize: '12px'}}>Privacy Policy</a> | <a href="https://thenudeapp.com/terms-of-service" style={{color: '#7B7B7B', fontSize: '12px'}}>Terms &amp; Conditions</a>
                            </td>
                          </tr>
                        </tbody></table>
                    </div>
                  </div>
                </td>
                <td style={{fontFamily: '"San Francisco", sans-serif', fontSize: '14px', verticalAlign: 'top'}}>&nbsp;</td>
              </tr>
            </tbody>
          </table>
        </div>

      Email.send
        from: 'NudeApp <hello@thenudeapp.com>'
        to: 'hello@hexa.systems'
        subject: 'Support Message'
        html: ReactDOM.renderToString template()
