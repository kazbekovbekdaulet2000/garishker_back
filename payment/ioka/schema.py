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
