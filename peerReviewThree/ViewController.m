//
//  ViewController.m
//  peerReviewThree
//
//  Created by Islam Kasem on 04/01/2021.
//

#import "ViewController.h"
#import "CurrencyRequest/CRCurrencyRequest.h"
#import "CurrencyRequest/CRCurrencyResults.h"

@interface ViewController () <CRCurrencyRequestDelegate>
@property (nonatomic) CRCurrencyRequest *req;
@property (weak, nonatomic) IBOutlet UITextField *inputField;
@property (weak, nonatomic) IBOutlet UIButton *convetBtn;
@property (weak, nonatomic) IBOutlet UILabel *currencyLblA;
@property (weak, nonatomic) IBOutlet UILabel *currencyLblB;
@property (weak, nonatomic) IBOutlet UILabel *currencyLblC;
@property (weak, nonatomic) IBOutlet UILabel *currencyLblD;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  

}
- (IBAction)convertBtnPressed:(id)sender {
    
    self.convetBtn.enabled = NO;
    self.req = [[CRCurrencyRequest alloc] init];
    self.req.delegate = self;
    [ self.req start];
 
    
}


- (void)currencyRequest:(CRCurrencyRequest *)req
    retrievedCurrencies:(CRCurrencyResults *)currencies{
    self.convetBtn.enabled = YES;
    self.currencyLblA.text = @"roundTrip";
    
    double inputValue = [self.inputField.text floatValue];
    
    // EUR -- EURO 
    double euroValue = inputValue * currencies.EUR;
    NSString *euroTemp = [NSString stringWithFormat:@"%.2f",euroValue];
    self.currencyLblA.text = euroTemp ;
    
    //JPY -- Japaness
    double jpyValue = inputValue * currencies.JPY;
    NSString *jpyTemp = [NSString  stringWithFormat:@"%.2f" , jpyValue];
    self.currencyLblB.text = jpyTemp ;
    
    //CHF --swiss franc
    double chfValue = inputValue * currencies.CHF ;
    NSString *chfTemp = [NSString stringWithFormat:@"%.2f", chfValue];
    self.currencyLblC.text = chfTemp ;
    
    //CZK --Czech Koruna
    double czkValue = inputValue * currencies.CZK ;
    NSString *czkTemp = [NSString stringWithFormat:@"%.2f", czkValue];
    self.currencyLblD.text = czkTemp ;
    
    

};





@end
