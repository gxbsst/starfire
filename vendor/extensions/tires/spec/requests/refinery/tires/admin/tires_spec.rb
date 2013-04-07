# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Tires" do
    describe "Admin" do
      describe "tires" do
        login_refinery_user

        describe "tires list" do
          before do
            FactoryGirl.create(:tire, :category => "UniqueTitleOne")
            FactoryGirl.create(:tire, :category => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.tires_admin_tires_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.tires_admin_tires_path

            click_link "Add New Tire"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Category", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Tires::Tire.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Category can't be blank")
              Refinery::Tires::Tire.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:tire, :category => "UniqueTitle") }

            it "should fail" do
              visit refinery.tires_admin_tires_path

              click_link "Add New Tire"

              fill_in "Category", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Tires::Tire.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:tire, :category => "A category") }

          it "should succeed" do
            visit refinery.tires_admin_tires_path

            within ".actions" do
              click_link "Edit this tire"
            end

            fill_in "Category", :with => "A different category"
            click_button "Save"

            page.should have_content("'A different category' was successfully updated.")
            page.should have_no_content("A category")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:tire, :category => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.tires_admin_tires_path

            click_link "Remove this tire forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Tires::Tire.count.should == 0
          end
        end

      end
    end
  end
end
