require 'rails_helper'

describe Contact do
  it "add 2 and 1 to make 3" do
    # 以前的写法
    # (2 + 1).should eq 3
    # 最新写法，本书用的也是
    expect(2 + 1).to eq 3
  end

  it "is valid with a firstname, lastname and email" do
    contact = Contact.new(
      firstname: "Aron",
      lastname: "Summer",
      email: "132123@qq.com")
    expect(contact).to be_valid
  end

  it "is invalid without a firstname" do
    contact = Contact.new(firstname: nil)
    contact.valid?
    expect(contact.errors[:firstname]).to include("can't be blank")
  end

  it "is invalid without a lastname" do
    contact = Contact.new(lastname: nil)
    contact.valid?
    expect(contact.errors[:lastname]).to include("can't be blank")
  end

  it "is invalid without an email address" do
    contact = Contact.new(email: nil)
    contact.valid?
    expect(contact.errors[:email]).to include("can't be blank")
  end

  it "is invalid with a duplicate email address" do
    Contact.create(
      firstname: 'Joe',
      lastname: 'Tester',
      email: 'test@example.com'
      )
    contact = Contact.new(
      firstname: 'Jane',
      lastname: 'Tester',
      email: 'test@example.com'
      )
    contact.valid?
    expect(contact.errors[:email]).to include("has already been taken")
  end

  it "returns a contact's full name as a string" do
    contact = Contact.new(firstname: 'John', lastname: 'Doe', email: 'johndoe@example.com')
    expect(contact.name).to eq 'John Doe'
  end

  it "returns a sorted array of results that match" do
    smith = Contact.create(
      firstname: 'John',
      lastname: 'Smith',
      email: 'jsmith@example.com')
    jones = Contact.create(
      firstname: 'Tim',
      lastname: 'Johes',
      email: 'tjones@example.com')
    johnson = Contact.create(
      firstname: 'John',
      lastname: 'Johnson',
      email: 'jjohnson@example.com')

    expect(Contact.by_letter('J')).to eq [jones ,johnson]
  end

  it "omits results that do not match" do
    smith = Contact.create(
      firstname: 'John',
      lastname: 'Smith',
      email: 'jsmith@example.com')
    jones = Contact.create(
      firstname: 'Tim',
      lastname: 'Johes',
      email: 'tjones@example.com')
    johnson = Contact.create(
      firstname: 'John',
      lastname: 'Johnson',
      email: 'jjohnson@example.com')

    expect(Contact.by_letter('J')).not_to include smith
  end
end