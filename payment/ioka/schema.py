from pydantic import BaseModel


class FundingInfo(BaseModel):
    model_id: int
    model: str
    funding_id: str


class CreateOrder(BaseModel):
    amount: int
    currency: str = "KZT"
    capture_method: str = "AUTO"
    external_id: str 
    description: str = None
    extra_info: FundingInfo = None
    attempts: int = None
    back_url: str


class Order(BaseModel):
    id: str
    mcc: str = None
    amount: int = None
    status: str = None
    shopId: str = None
    external_id: str = None
    capture_method: str = "AUTO"


class Payer(BaseModel):
    iin: str = None
    email: str = None
    phone: str = None


class Payment(BaseModel):
    id: str
    tds: bool = False
    payer: Payer = None
    processing_fee: int = None
    approved_amount: int = None
    captured_amount: int = None

class WebhookResponse(BaseModel):
    event: str
    order: Order = None
    payment: Payment = None