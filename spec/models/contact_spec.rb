require 'rails_helper'

describe Contact do
  it "add 2 and 1 to make 3" do
    # 以前的写法
    # (2 + 1).should eq 3
    # 最新写法，本书用的也是
    expect(2 + 1).to eq 3
  end

  it "is valid with a firstname, lastname and email" do
    expect(build(:contact)).to be_valid
  end

  it "is invalid without a firstname" do
    contact = build(:contact, firstname: nil)
    contact.valid?
    expect(contact.errors[:firstname]).to include("can't be blank")
  end

  it "is invalid without a lastname" do
    contact = build(:contact, lastname: nil)
    contact.valid?
    expect(contact.errors[:lastname]).to include("can't be blank")
  end

  it "is invalid without an email address" do
    contact = build(:contact, email: nil)
    contact.valid?
    expect(contact.errors[:email]).to include("can't be blank")
  end

  it "is invalid with a duplicate email address" do
    create(:contact, email: 'aaron@example.com')
    contact = build(:contact, email: 'aaron@example.com')
    contact.valid?
    expect(contact.errors[:email]).to include("has already been taken")
  end

  it "returns a contact's full name as a string" do
    contact = build(:contact, firstname: 'John', lastname: 'Doe')
    expect(contact.name).to eq 'John Doe'
  end

    # validation examples ...
  # describe "filter last name by letter" do
  #   before :each do
  #     @smith = Contact.create(
  #       firstname: 'John',
  #       lastname: 'Smith',
  #       email: 'jsmith@example.com')
  #     @jones = Contact.create(
  #       firstname: 'Tim',
  #       lastname: 'Johes',
  #       email: 'tjones@example.com')
  #     @johnson = Contact.create(
  #       firstname: 'John',
  #       lastname: 'Johnson',
  #       email: 'jjohnson@example.com')
  #   end

  #   context "with matching letters" do
  #     it "returns a sorted array of results that match" do
  #       expect(Contact.by_letter('J')).to eq [@jones ,@johnson]
  #     end
  #   end

  #   context "with non-matching letters" do
  #     it "omits results that do not match" do
  #       expect(Contact.by_letter('J')).not_to include @smith
  #     end
  #   end
  # end

  it "has a valid factory" do
    expect(build(:contact)).to be_valid
  end

  it "has three phone numbers" do
    expect(create(:contact).phones.count).to eq 3
  end
end